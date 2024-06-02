#!/bin/sh
#
# Makefile, but shell script.
#
# SPDX-FileCopyrightText: 2024 Junde Yhi <junde@yhi.moe>
# SPDX-License-Identifier: CC0-1.0

help() {
  printf 'Usage: %s [flatpak|docker|podman|all]\n' "$0"
}

build_flatpak() {
  flatpak run org.flatpak.Builder --force-clean --sandbox --user --install \
    --install-deps-from=flathub --ccache \
    --mirror-screenshots-url=https://dl.flathub.org/media/ --repo=repo \
    build org.freedesktop.Sdk.Extension.gnat14.yml
}

build_docker() {
  command -v docker > /dev/null 2>&1 && cnr=docker || cnr=podman
  "${cnr}" build . -t freedesktop.org/sdk/gnat14
  unset cnr
}

TARGET="$1"

case "${TARGET}" in
  'flatpak') build_flatpak ;;
  'docker'|'podman') build_docker ;;
  'all') build_flatpak && build_docker ;;
  *) help ;;
esac

unset TARGET
