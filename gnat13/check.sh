#!/bin/sh

printf 'Checking manifest...\n'
flatpak run --command=flatpak-builder-lint org.flatpak.Builder \
  manifest org.freedesktop.Sdk.Extension.gnat13.yml

printf 'Checking AppStream metadata...\n'
flatpak run --command=flatpak-builder-lint org.flatpak.Builder \
  appstream org.freedesktop.Sdk.Extension.gnat13.metainfo.xml

if test -d repo; then
  printf 'Checking Flatpak repo...\n'
  flatpak run --command=flatpak-builder-lint org.flatpak.Builder repo repo
fi
