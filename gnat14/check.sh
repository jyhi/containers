#!/bin/sh
#
# Run linters.
#
# SPDX-FileCopyrightText: 2024 Junde Yhi <junde@yhi.moe>
# SPDX-License-Identifier: CC0-1.0

printf 'Checking manifest...\n'
flatpak run --command=flatpak-builder-lint org.flatpak.Builder \
  manifest org.freedesktop.Sdk.Extension.gnat14.yml

printf 'Checking AppStream metadata...\n'
flatpak run --command=flatpak-builder-lint org.flatpak.Builder \
  appstream org.freedesktop.Sdk.Extension.gnat14.metainfo.xml

if test -d repo; then
  printf 'Checking Flatpak repo...\n'
  flatpak run --command=flatpak-builder-lint org.flatpak.Builder repo repo
fi

if test -d build; then
  printf 'Checking Flatpak builddir...\n'
  flatpak run --command=flatpak-builder-lint org.flatpak.Builder builddir build
fi
