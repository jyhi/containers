# SPDX-FileCopyrightText: 2024 Junde Yhi <junde@yhi.moe>
# SPDX-License-Identifier: CC0-1.0

FLATPAK ?= flatpak
DOCKER ?= docker

FLATPAK_ID = org.freedesktop.Sdk.Extension.gnat14
DOCKER_TAG = freedesktop.org/sdk/gnat14:23.08
DOCKER_FN = freedesktop.org_sdk_gnat14_23.08.tar

.PHONY: all flatpak docker check check-flatpak dist clean clean-flatpak \
	clean-docker distclean

all: flatpak

flatpak: .flatpak.built

docker: .docker.built

check: .flatpak.built check-flatpak

check-flatpak: check-manifest check-metadata check-repo check-builddir

check-manifest:
	@printf 'Checking manifest...\n'
	$(FLATPAK) run --command=flatpak-builder-lint org.flatpak.Builder manifest \
		$(FLATPAK_ID).yml

check-metadata:
	@printf 'Checking AppStream metadata...\n'
	$(FLATPAK) run --command=flatpak-builder-lint org.flatpak.Builder appstream \
		$(FLATPAK_ID).metainfo.xml

check-repo:
	@printf 'Checking Flatpak repo...\n'
	$(FLATPAK) run --command=flatpak-builder-lint org.flatpak.Builder repo repo

check-builddir:
	@printf 'Checking Flatpak builddir...\n'
	$(FLATPAK) run --command=flatpak-builder-lint org.flatpak.Builder builddir \
		build

dist: $(DOCKER_FN)

$(DOCKER_FN): .docker.built
	$(DOCKER) save --output $@ $(DOCKER_TAG)

clean: clean-flatpak clean-docker

clean-flatpak:
	$(RM) .flatpak.built
	$(RM) -r .flatpak-builder build repo

clean-docker:
	$(RM) .docker.built $(DOCKER_FN)

distclean: clean
	$(DOCKER) rmi --force $(DOCKER_TAG)

.flatpak.built: $(FLATPAK_ID).yml $(FLATPAK_ID).metainfo.xml
	$(FLATPAK) run org.flatpak.Builder --force-clean --sandbox --user --install \
    --install-deps-from=flathub --ccache \
    --mirror-screenshots-url=https://dl.flathub.org/media/ --repo=repo \
    build $(FLATPAK_ID).yml
	touch $@

.docker.built: Dockerfile .flatpak.built
	$(DOCKER) build . -t $(DOCKER_TAG)
	touch $@
