ARCH ?= $(shell flatpak --default-arch)

BST ?= bst

OUTDIR ?= out

all: $(OUTDIR)/flatpak-runtimes.tar $(OUTDIR)/flatpak-platform-extensions.tar

$(OUTDIR):
	mkdir -p $(OUTDIR)

flatpak-runtimes: elements/**/*.bst
	$(BST) -o arch $(ARCH) build flatpak-runtimes.bst
.PHONY: flatpak-runtimes

fetch-junctions:
	$(BST) -o arch $(ARCH) fetch freedesktop-sdk.bst
	$(BST) -o arch $(ARCH) fetch gnome-sdk.bst
.PHONY: fetch-junctions

check-flatpak-runtimes: | fetch-junctions
	$(BST) -o arch $(ARCH) show flatpak-runtimes.bst
.PHONY: check-flatpak-runtimes
check: check-flatpak-runtimes

$(OUTDIR)/flatpak-runtimes.tar: flatpak-runtimes | $(OUTDIR)
	$(BST) -o arch $(ARCH) checkout flatpak-runtimes.bst --force --tar $(OUTDIR)/flatpak-runtimes.tar

clean-$(OUTDIR)/flatpak-runtimes.tar:
	rm -f $(OUTDIR)/flatpak-runtimes.tar
.PHONY: clean-$(OUTDIR)/flatpak-runtimes.tar
clean: clean-$(OUTDIR)/flatpak-runtimes.tar

flatpak-platform-extensions: elements/**/*.bst
	$(BST) -o arch $(ARCH) build flatpak-platform-extensions.bst
.PHONY: flatpak-platform-extensions

check-flatpak-platform-extensions: | fetch-junctions
	$(BST) -o arch $(ARCH) show flatpak-platform-extensions.bst
.PHONY: check-flatpak-platform-extensions
check: check-flatpak-platform-extensions

$(OUTDIR)/flatpak-platform-extensions.tar: flatpak-platform-extensions | $(OUTDIR)
	$(BST) -o arch $(ARCH) checkout flatpak-platform-extensions.bst --force --tar $(OUTDIR)/flatpak-platform-extensions.tar

clean-$(OUTDIR)/flatpak-platform-extensions.tar:
	rm -f $(OUTDIR)/flatpak-platform-extensions.tar
.PHONY: clean-$(OUTDIR)/flatpak-platform-extensions.tar
clean: clean-$(OUTDIR)/flatpak-platform-extensions.tar

check: ;
.PHONY: check

clean:
	if [ -d "${OUTDIR}" ]; then rmdir $(OUTDIR); fi
.PHONY: clean
