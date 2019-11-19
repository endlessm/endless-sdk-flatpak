ARCH ?= $(shell flatpak --default-arch)

BST ?= bst

OUTDIR ?= out
CACHEDIR ?= cache
REPO ?= repo

FLATPAK_RUNTIMES_REPO = $(CACHEDIR)/flatpak-runtimes-repo
FLATPAK_PLATFORM_EXTENSIONS_REPO = $(CACHEDIR)/flatpak-platform-extensions-repo

FLATPAK_REFS = $(shell [ -d "$(REPO)" ] && ostree refs --repo $(REPO))

define bundle-ref
	$(shell flatpak build-bundle $(1) "$(OUTDIR)/$(subst /,-,$(2)).flatpak" $(2))
endef

define clean-ref
	$(shell rm -f "$(OUTDIR)/$(subst /,-,$(1)).flatpak")
endef

all: export

check: ;
.PHONY: check

clean:
	if [ -d "$(OUTDIR)" ]; then rmdir $(OUTDIR); fi
	if [ -d "$(CACHEDIR)" ]; then rmdir $(CACHEDIR); fi
	if [ -d "$(REPO)" ]; then rm -r $(REPO); fi
.PHONY: clean

export: ;
.PHONY: export

bundle: ;
.PHONY: bundle

fetch-junctions:
	$(BST) -o arch $(ARCH) fetch freedesktop-sdk.bst
	$(BST) -o arch $(ARCH) fetch gnome-sdk.bst
.PHONY: fetch-junctions


$(OUTDIR):
	mkdir -p $(OUTDIR)

$(CACHEDIR):
	mkdir -p $(CACHEDIR)

$(REPO):
	ostree init --repo=$(REPO) --mode=bare-user-only


BUILD-flatpak-runtimes: elements/**/*.bst
	$(BST) -o arch $(ARCH) build flatpak-runtimes.bst
.PHONY: BUILD-flatpak-runtimes

CHECK-flatpak-runtimes: | fetch-junctions
	$(BST) -o arch $(ARCH) show flatpak-runtimes.bst
.PHONY: CHECK-flatpak-runtimes
check: CHECK-flatpak-runtimes

$(FLATPAK_RUNTIMES_REPO): BUILD-flatpak-runtimes | $(CACHEDIR)
	$(BST) -o arch $(ARCH) checkout flatpak-runtimes.bst --force $@

EXPORT-$(FLATPAK_RUNTIMES_REPO): $(FLATPAK_RUNTIMES_REPO) | $(REPO)
	ostree pull-local --repo=$(REPO) $(FLATPAK_RUNTIMES_REPO)
.PHONY: EXPORT-$(FLATPAK_RUNTIMES_REPO)
export: EXPORT-$(FLATPAK_RUNTIMES_REPO)

CLEAN-$(FLATPAK_RUNTIMES_REPO):
	rm -rf $(FLATPAK_RUNTIMES_REPO)
.PHONY: CLEAN-$(FLATPAK_RUNTIMES_REPO)
clean: CLEAN-$(FLATPAK_RUNTIMES_REPO)


BUILD-flatpak-platform-extensions: elements/**/*.bst
	$(BST) -o arch $(ARCH) build flatpak-platform-extensions.bst
.PHONY: BUILD-flatpak-platform-extensions

CHECK-flatpak-platform-extensions: | fetch-junctions
	$(BST) -o arch $(ARCH) show flatpak-platform-extensions.bst
.PHONY: CHECK-flatpak-platform-extensions
check: CHECK-flatpak-platform-extensions

$(FLATPAK_PLATFORM_EXTENSIONS_REPO): BUILD-flatpak-platform-extensions | $(CACHEDIR)
	$(BST) -o arch $(ARCH) checkout flatpak-platform-extensions.bst --force $@

EXPORT-$(FLATPAK_PLATFORM_EXTENSIONS_REPO): $(FLATPAK_PLATFORM_EXTENSIONS_REPO) | $(REPO)
	ostree pull-local --repo=$(REPO) $(FLATPAK_PLATFORM_EXTENSIONS_REPO)
.PHONY: EXPORT-$(FLATPAK_PLATFORM_EXTENSIONS_REPO)
export: EXPORT-$(FLATPAK_PLATFORM_EXTENSIONS_REPO)

CLEAN-$(FLATPAK_PLATFORM_EXTENSIONS_REPO):
	rm -rf $(FLATPAK_PLATFORM_EXTENSIONS_REPO)
.PHONY: CLEAN-$(FLATPAK_PLATFORM_EXTENSIONS_REPO)
clean: CLEAN-$(FLATPAK_PLATFORM_EXTENSIONS_REPO)


BUNDLE-$(REPO): $(REPO) export | $(OUTDIR)
	$(foreach ref,$(FLATPAK_REFS),$(call bundle-ref,$(REPO),$(ref)))
.PHONY: BUNDLE-$(REPO)
bundle: BUNDLE-$(REPO)

CLEAN-BUNDLE-$(REPO):
	$(foreach ref,$(FLATPAK_REFS),$(call clean-ref,$(ref)))
.PHONY: CLEAN-BUNDLE-$(REPO)
clean: CLEAN-BUNDLE-$(REPO)
