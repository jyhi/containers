# org.freedesktop.Sdk.Extension.gnat15, but Docker.
#
# SPDX-FileCopyrightText: 2025 Junde Yhi <junde@yhi.moe>
# SPDX-License-Identifier: CC0-1.0

FROM docker.io/freedesktopsdk/sdk:24.08

# Run Flatpak Builder first!
COPY build/files /usr/lib/sdk/gnat15

LABEL org.opencontainers.image.title="GNAT 15" \
org.opencontainers.image.description="GNU Ada/SPARK compiler and build environment" \
org.opencontainers.image.licenses="GPL-3.0-or-later" \
org.opencontainers.image.version="15.1.0-2+docker.2"
