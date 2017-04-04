# Replace with `make ARCH=xxx` to build for another architecture
ARCH ?= $(shell flatpak --default-arch)

# Replace with `make REPO=xxx` to build another repository
REPO ?= repo

# The branch of the Endless SDK to build
SDK_BRANCH ?= master

# The version of the Freedesktop runtime we build on
FDO_RUNTIME_VERSION ?= 1.6

# The version of the GNOME runtime we build on
GNOME_RUNTIME_VERSION ?= 3.24

SUBST_FILES = \
	com.endlessm.Sdk.json \
	com.endlessm.Sdk.appdata.xml \
	com.endlessm.Platform.appdata.xml \
	metadata.sdk \
	metadata.platform \
	os-release \
	issue \
	issue.net \
	$()

define subst-metadata
	@for file in ${SUBST_FILES}; do                                         \
	  file_source=$${file}.in;                                              \
	  echo "  GEN   $${file}";						\
	  sed -e 's/@@SDK_ARCH@@/${ARCH}/g'                                     \
	      -e 's/@@SDK_BRANCH@@/${SDK_BRANCH}/g'                             \
	      -e 's/@@GNOME_RUNTIME_VERSION@@/${GNOME_RUNTIME_VERSION}/g'       \
	      -e 's/@@FDO_RUNTIME_VERSION@@/${FDO_RUNTIME_VERSION}/g'           \
	      $$file_source > $$file.tmp && mv $$file.tmp $$file || exit 1;     \
	done
endef

all: ${REPO} $(patsubst %,%.in,$(SUBST_FILES))
	$(call subst-metadata)
	flatpak-builder \
		--force-clean --disable-cache --require-changes \
		--repo=${REPO} \
		--arch=${ARCH} \
		--subject="Build of com.endlessm.Sdk, `date`" \
		${EXPORT_ARGS} sdk com.endlessm.Sdk.json

${REPO}:
	ostree  init --mode=archive-z2 --repo=${REPO}

check: com.endlessm.Sdk.json.in
	$(call subst-metadata)
	@echo "  CHK   $<"; json-glib-validate com.endlessm.Sdk.json

clean:
	@rm -rf sdk
	@rm -rf ${REPO}
	@rm -f ${SUBST_FILES}

maintainer-clean: clean
	@rm -rf .flatpak-builder
