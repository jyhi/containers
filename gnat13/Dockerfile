# org.freedesktop.Sdk.Extension.gnat13, but Docker.
#
# SPDX-FileCopyrightText: 2024 Junde Yhi <junde@yhi.moe>
# SPDX-License-Identifier: CC0-1.0

FROM docker.io/freedesktopsdk/sdk:23.08

# Run Flatpak Builder first!
COPY build/files /usr/lib/sdk/gnat13

LABEL org.opencontainers.image.title="GNAT 13" \
org.opencontainers.image.description="GNU Ada/SPARK compiler and build environment" \
org.opencontainers.image.licenses="GPL-3.0-or-later" \
org.opencontainers.image.version="13.2.0-2+docker.3.0"
