# Replace with `make ARCH=xxx` to build for another architecture
ARCH ?= $(shell flatpak --default-arch)

# Replace with `make REPO=xxx` to build another repository
REPO ?= repo

# The branch of the Endless SDK to build
SDK_BRANCH ?= master

# The version of the Freedesktop runtime we build on
FDO_RUNTIME_VERSION ?= 1.6

# The version of the GNOME runtime we build on
GNOME_RUNTIME_VERSION ?= 3.26

BUILD_TAG ?= $(shell date +%Y-%m-%d)

FDO_DEPS = \
	org.freedesktop.Sdk/${ARCH}/${FDO_RUNTIME_VERSION} \
	org.freedesktop.Platform/${ARCH}/${FDO_RUNTIME_VERSION} \
	$()

GNOME_DEPS = \
	org.gnome.Sdk/${ARCH}/${GNOME_RUNTIME_VERSION} \
	org.gnome.Sdk.Debug/${ARCH}/${GNOME_RUNTIME_VERSION} \
	org.gnome.Sdk.Docs/${ARCH}/${GNOME_RUNTIME_VERSION} \
	org.gnome.Platform/${ARCH}/${GNOME_RUNTIME_VERSION} \
	$()

LOCALE_DEPS = \
	org.gnome.Platform.Locale/${ARCH}/${GNOME_RUNTIME_VERSION} \
	org.gnome.Sdk.Locale/${ARCH}/${GNOME_RUNTIME_VERSION} \
	$()

SDK_DEPS = \
	com.endlessm.apps.Sdk.json \
	com.endlessm.apps.Sdk.appdata.xml \
	com.endlessm.apps.Platform.appdata.xml \
	metadata.sdk \
	metadata.platform \
	os-release \
	issue \
	issue.net \
	$()

GOOGLE_FONTS = \
	Fira+Sans \
	Lato \
	Libre+Baskerville \
	Merriweather \
	Noto+Sans \
	Noto+Serif \
	Raleway \
	Roboto \
	$()

ICONTHEME_DEPS = \
	org.freedesktop.Platform.Icontheme.EndlessOS.json \
	org.freedesktop.Platform.Icontheme.EndlessOS.appdata.xml \
	$()

# Generic substitution rule
%: %.in
	@echo "  GEN   $@" &&                                            \
	sed -e 's/@@SDK_ARCH@@/${ARCH}/g'                                \
	    -e 's/@@SDK_BRANCH@@/${SDK_BRANCH}/g'                        \
	    -e 's/@@GNOME_RUNTIME_VERSION@@/${GNOME_RUNTIME_VERSION}/g'  \
	    -e 's/@@FDO_RUNTIME_VERSION@@/${FDO_RUNTIME_VERSION}/g'      \
	    $< > $@.tmp && mv $@.tmp $@

define build-manifest
	@flatpak-builder --version
	flatpak-builder \
		--force-clean --ccache --require-changes \
		--repo=${REPO} \
		--arch=${ARCH} \
		--subject="Build of $1, `date`" \
		${EXPORT_ARGS} \
		builddir \
		$1
endef

all: sdk icontheme

sdk: ${REPO} $(SDK_DEPS)
	$(call build-manifest,com.endlessm.apps.Sdk.json)

icontheme: ${REPO} $(ICONTHEME_DEPS)
	$(call build-manifest,org.freedesktop.Platform.Icontheme.EndlessOS.json)

${REPO}:
	ostree init --mode=archive-z2 --repo=${REPO}

com.endlessm.apps.Sdk.json: com.endlessm.apps.Sdk.json.in generate-manifest.py Makefile
	@echo "  GEN   $@"; \
	./generate-manifest.py \
		--arch=$(ARCH) \
		--sdk-branch=$(SDK_BRANCH) \
		--base-runtime-version=$(GNOME_RUNTIME_VERSION) \
		$< > $@

add-repo:
	flatpak remote-add --user --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

install-dependencies: add-repo
	for dep in $(FDO_DEPS) $(GNOME_DEPS); do \
		flatpak install --user flathub $$dep ; \
		flatpak update --user $$dep ; \
	done
	flatpak list --user --runtime --show-details

install-locale-dependencies: add-repo
	for dep in $(LOCALE_DEPS); do \
		flatpak uninstall --user $$dep ; \
		flatpak install --user flathub $$dep ; \
	done
	flatpak list --user --runtime --all --show-details

clean-dependencies: add-repo
	flatpak uninstall --user $(FDO_DEPS)
	flatpak uninstall --user $(GNOME_DEPS)

check: com.endlessm.apps.Sdk.json
	@echo "  CHK   $<"; json-glib-validate com.endlessm.apps.Sdk.json

clean:
	@rm -rf builddir 
	@rm -f ${SUBST_FILES}
	@rm -f com.endlessm.apps.Sdk.json

maintainer-clean: clean
	@rm -rf .flatpak-builder
	@rm -rf ${REPO}

import-artefacts:
	@if [ -f ${REPO}.tar ]; then \
	    tar xf ${REPO}.tar && \
	    ostree fsck --repo=${REPO} ; \
	    rm -f ${REPO}.tar
	fi

bundle-artefacts:
	@tar cf ${REPO}.tar ${REPO}

update-fonts:
	@for font in $(GOOGLE_FONTS); do \
		wget https://fonts.google.com/download?family=$$font -O fonts/$$font.zip; \
	done

.PHONY: sdk icontheme add-repo install-dependencies clean-dependencies maintainer-clean bundle-artefacts
