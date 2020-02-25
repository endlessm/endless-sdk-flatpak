ARCH ?= $(shell flatpak --default-arch)
BOOTSTRAP_ARCH ?= $(shell flatpak --default-arch)

EXPORT_ARGS ?=

GIT ?= git

BST ?= bst
BST_ARGS ?=
_BST_ARGS ?= --no-interactive -o arch $(ARCH) -o bootstrap_build_arch $(BOOTSTRAP_ARCH)

OSTREE ?= ostree

OUTDIR ?= out
CACHEDIR ?= cache
REPO ?= repo

FLATPAK_RUNTIMES_REPO = $(CACHEDIR)/flatpak-runtimes-repo
FLATPAK_PLATFORM_EXTENSIONS_REPO = $(CACHEDIR)/flatpak-platform-extensions-repo
EXPORT_REPO = $(REPO)

EXPORT_REFS = $(shell [ -d "$(EXPORT_REPO)" ] && $(OSTREE) refs --repo $(EXPORT_REPO))

GIT_HOOKS = $(shell [ -d ".git/hooks" ] && echo ".git/hooks/pre-commit")


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
	if [ -d "$(EXPORT_REPO)" ]; then rm -r $(EXPORT_REPO); fi
.PHONY: clean

export: | $(EXPORT_REPO)
ifneq ($(EXPORT_ARGS),)
	flatpak build-sign $(EXPORT_ARGS) $|
endif
	flatpak build-update-repo $(EXPORT_ARGS) $|
.PHONY: export

bundle: ;
.PHONY: bundle

fetch-junctions:
	$(BST) $(BST_ARGS) $(_BST_ARGS) fetch freedesktop-sdk.bst gnome-sdk.bst
.PHONY: fetch-junctions

track:
	$(BST) $(BST_ARGS) $(_BST_ARGS) track freedesktop-sdk.bst gnome-sdk.bst
	$(BST) $(BST_ARGS) $(_BST_ARGS) track flatpak-runtimes.bst flatpak-platform-extensions.bst --deps=all
.PHONY: track


$(OUTDIR):
	mkdir -p $@

$(CACHEDIR):
	mkdir -p $@

$(EXPORT_REPO):
	$(OSTREE) init --repo=$@ --mode=archive


.git/hooks/pre-commit: utils/git-pre-commit
	ln -frs $< .git/hooks/pre-commit


flatpak-version.yml: $(GIT_HOOKS) | CLEAN-flatpak-version.yml
	./utils/generate-version $@
.PHONY: flatpak-version.yml

CLEAN-flatpak-version.yml:
	$(GIT) checkout HEAD flatpak-version.yml
.PHONY: CLEAN-flatpak-version.yml
clean: CLEAN-flatpak-version.yml


BUILD-flatpak-runtimes: flatpak-version.yml elements/**/*.bst
	$(BST) $(BST_ARGS) $(_BST_ARGS) build flatpak-runtimes.bst
.PHONY: BUILD-flatpak-runtimes

CHECK-flatpak-runtimes: flatpak-version.yml | fetch-junctions
	$(BST) $(BST_ARGS) $(_BST_ARGS) show flatpak-runtimes.bst
.PHONY: CHECK-flatpak-runtimes
check: CHECK-flatpak-runtimes

$(FLATPAK_RUNTIMES_REPO): BUILD-flatpak-runtimes | $(CACHEDIR)
	$(BST) $(BST_ARGS) $(_BST_ARGS) checkout --hardlinks --force flatpak-runtimes.bst $@

EXPORT-$(FLATPAK_RUNTIMES_REPO): $(FLATPAK_RUNTIMES_REPO) | $(EXPORT_REPO)
	$(OSTREE) pull-local --repo=$| $<
.PHONY: EXPORT-$(FLATPAK_RUNTIMES_REPO)
export: EXPORT-$(FLATPAK_RUNTIMES_REPO)

CLEAN-$(FLATPAK_RUNTIMES_REPO):
	rm -rf $(FLATPAK_RUNTIMES_REPO)
.PHONY: CLEAN-$(FLATPAK_RUNTIMES_REPO)
clean: CLEAN-$(FLATPAK_RUNTIMES_REPO)


BUILD-flatpak-platform-extensions: elements/**/*.bst
	$(BST) $(BST_ARGS) $(_BST_ARGS) build flatpak-platform-extensions.bst
.PHONY: BUILD-flatpak-platform-extensions

CHECK-flatpak-platform-extensions: | fetch-junctions
	$(BST) $(BST_ARGS) $(_BST_ARGS) show flatpak-platform-extensions.bst
.PHONY: CHECK-flatpak-platform-extensions
check: CHECK-flatpak-platform-extensions

$(FLATPAK_PLATFORM_EXTENSIONS_REPO): BUILD-flatpak-platform-extensions | $(CACHEDIR)
	$(BST) $(BST_ARGS) $(_BST_ARGS) checkout --hardlinks --force flatpak-platform-extensions.bst $@

EXPORT-$(FLATPAK_PLATFORM_EXTENSIONS_REPO): $(FLATPAK_PLATFORM_EXTENSIONS_REPO) | $(EXPORT_REPO)
	$(OSTREE) pull-local --repo=$| $<
.PHONY: EXPORT-$(FLATPAK_PLATFORM_EXTENSIONS_REPO)
export: EXPORT-$(FLATPAK_PLATFORM_EXTENSIONS_REPO)

CLEAN-$(FLATPAK_PLATFORM_EXTENSIONS_REPO):
	rm -rf $(FLATPAK_PLATFORM_EXTENSIONS_REPO)
.PHONY: CLEAN-$(FLATPAK_PLATFORM_EXTENSIONS_REPO)
clean: CLEAN-$(FLATPAK_PLATFORM_EXTENSIONS_REPO)


BUNDLE-$(EXPORT_REPO): $(EXPORT_REPO) export | $(OUTDIR)
	$(foreach ref,$(EXPORT_REFS),$(call bundle-ref,$(EXPORT_REPO),$(ref)))
.PHONY: BUNDLE-$(EXPORT_REPO)
bundle: BUNDLE-$(EXPORT_REPO)

CLEAN-BUNDLE-$(EXPORT_REPO):
	$(foreach ref,$(EXPORT_REFS),$(call clean-ref,$(ref)))
.PHONY: CLEAN-BUNDLE-$(EXPORT_REPO)
clean: CLEAN-BUNDLE-$(EXPORT_REPO)
