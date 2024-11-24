GIT ?= git
BST ?= bst
OSTREE ?= ostree
FLATPAK ?= flatpak

ARCH ?= $(shell $(FLATPAK) --default-arch)
BOOTSTRAP_ARCH ?= $(shell $(FLATPAK) --default-arch)

BST_ARGS ?=
_BST_ARGS ?= --no-interactive -o arch $(ARCH) -o bootstrap_build_arch $(BOOTSTRAP_ARCH)

EXPORT_ARGS ?=

OUTDIR ?= out
CACHEDIR ?= cache
REPO ?= repo

FLATPAK_RUNTIMES_REPO = $(CACHEDIR)/flatpak-runtimes-repo
EXPORT_REPO = $(REPO)

EXPORT_REFS = $(shell [ -d "$(EXPORT_REPO)" ] && $(OSTREE) refs --repo $(EXPORT_REPO))

GIT_HOOKS = $(shell [ -d ".git/hooks" ] && echo ".git/hooks/pre-commit")

ALL_BST_FILES = $(patsubst elements/%.bst,%.bst,$(shell find elements/ -type f -name '*.bst'))
JUNCTION_BST_FILES = freedesktop-sdk.bst gnome-sdk.bst
TOPLEVEL_BST_FILES =


define bundle-ref
	$(shell flatpak build-bundle $(1) "$(OUTDIR)/$(subst /,-,$(2)).flatpak" $(2))
endef

define clean-ref
	$(shell rm -f "$(OUTDIR)/$(subst /,-,$(1)).flatpak")
endef


all: export

TOPLEVEL_BST_FILES += tests.bst

check:
	$(BST) $(BST_ARGS) $(_BST_ARGS) build tests.bst
.PHONY: check

check-format: ;
.PHONY: check-format
check: check-format

clean:
	if [ -d "$(OUTDIR)" ]; then rmdir $(OUTDIR); fi
	if [ -d "$(CACHEDIR)" ]; then rmdir $(CACHEDIR); fi
	if [ -d "$(EXPORT_REPO)" ]; then rm -r $(EXPORT_REPO); fi
.PHONY: clean

export: | $(EXPORT_REPO)
ifneq ($(EXPORT_ARGS),)
	$(FLATPAK) build-sign $(EXPORT_ARGS) $|
endif
	$(FLATPAK) build-update-repo $(EXPORT_ARGS) $|
.PHONY: export

bundle: ;
.PHONY: bundle

fetch-junctions: junction.refs
	$(BST) $(BST_ARGS) $(_BST_ARGS) fetch $(JUNCTION_BST_FILES)
.PHONY: fetch-junctions

track:
	$(BST) $(BST_ARGS) $(_BST_ARGS) track $(ALL_BST_FILES)
.PHONY: track

push:
	$(BST) $(BST_ARGS) $(_BST_ARGS) push $(TOPLEVEL_BST_FILES) --deps=all
.PHONY: push

push-endless-sdk:
	$(BST) $(BST_ARGS) $(_BST_ARGS) push $(ALL_BST_FILES)
.PHONY: push-endless-sdk


$(OUTDIR):
	mkdir -p $@

$(CACHEDIR):
	mkdir -p $@

ostree-version:
	$(OSTREE) --version

$(EXPORT_REPO):
	env
	which ostree
	pwd
#	strace $(OSTREE) --version
	/usr/bin/ostree --version
	set -x; type ostree; type $(OSTREE); ostree --version; $(OSTREE) --version
	$(OSTREE) --version
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


TOPLEVEL_BST_FILES += flatpak-runtimes.bst

BUILD-flatpak-runtimes: flatpak-version.yml
	$(BST) $(BST_ARGS) $(_BST_ARGS) build flatpak-runtimes.bst
.PHONY: BUILD-flatpak-runtimes

CHECK-FORMAT-flatpak-runtimes: flatpak-version.yml | fetch-junctions
	$(BST) $(BST_ARGS) $(_BST_ARGS) show flatpak-runtimes.bst
.PHONY: CHECK-FORMAT-flatpak-runtimes
check-format: CHECK-FORMAT-flatpak-runtimes

$(FLATPAK_RUNTIMES_REPO): BUILD-flatpak-runtimes | $(CACHEDIR)
	rm -rf "$@"
	$(BST) $(BST_ARGS) $(_BST_ARGS) checkout --hardlinks flatpak-runtimes.bst $@

EXPORT-$(FLATPAK_RUNTIMES_REPO): $(FLATPAK_RUNTIMES_REPO) | $(EXPORT_REPO)
	$(OSTREE) pull-local --repo=$| $<
.PHONY: EXPORT-$(FLATPAK_RUNTIMES_REPO)
export: EXPORT-$(FLATPAK_RUNTIMES_REPO)

CLEAN-$(FLATPAK_RUNTIMES_REPO):
	rm -rf $(FLATPAK_RUNTIMES_REPO)
.PHONY: CLEAN-$(FLATPAK_RUNTIMES_REPO)
clean: CLEAN-$(FLATPAK_RUNTIMES_REPO)


BUNDLE-$(EXPORT_REPO): $(EXPORT_REPO) export | $(OUTDIR)
	$(foreach ref,$(EXPORT_REFS),$(call bundle-ref,$(EXPORT_REPO),$(ref)))
.PHONY: BUNDLE-$(EXPORT_REPO)
bundle: BUNDLE-$(EXPORT_REPO)

CLEAN-BUNDLE-$(EXPORT_REPO):
	$(foreach ref,$(EXPORT_REFS),$(call clean-ref,$(ref)))
.PHONY: CLEAN-BUNDLE-$(EXPORT_REPO)
clean: CLEAN-BUNDLE-$(EXPORT_REPO)
