# SPDX-FileCopyrightText: 2023 Junde Yhi <junde@yhi.moe>
# SPDX-License-Identifier: GPL-3.0-or-later

FROM debian:12

# Alire depends on cURL and Git to download packages.
RUN apt-get update && \
apt-get install --yes gnat gprbuild curl git alire && \
rm -rf /var/lib/apt/lists/*

# Stop Alire from interactively asking for a selection of toolchain.
RUN alr toolchain --disable-assistant

LABEL \
org.opencontainers.image.title="Ada on Debian" \
org.opencontainers.image.description="Ada development environment based on Debian packages." \
org.opencontainers.image.authors="Junde Yhi <junde@yhi.moe>"
