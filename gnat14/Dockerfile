# org.freedesktop.Sdk.Extension.gnat14, but Docker.
#
# SPDX-FileCopyrightText: 2024 Junde Yhi <junde@yhi.moe>
# SPDX-License-Identifier: CC0-1.0

FROM docker.io/freedesktopsdk/sdk:23.08

# Run Flatpak Builder first!
COPY build/files /usr/lib/sdk/gnat14

LABEL org.opencontainers.image.title="GNAT 14" \
org.opencontainers.image.description="GNU Ada/SPARK compiler and build environment" \
org.opencontainers.image.licenses="GPL-3.0-or-later" \
org.opencontainers.image.version="14.1.0-2+docker.1"
