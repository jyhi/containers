# SPDX-FileCopyrightText: 2023 Junde Yhi <junde@yhi.moe>
# SPDX-License-Identifier: GPL-3.0-or-later

FROM debian

# Install the latest GNAT, GPRbuild and Alire from Debian. Alire depends on
# cURL and Git to download packages and the index.
RUN apt-get update && \
apt-get install -y gnat gprbuild curl git alire && \
rm -rf /var/lib/apt/lists/*

# Stop Alire from interactively asking for a selection of toolchain.
RUN alr toolchain --disable-assistant

LABEL \
org.opencontainers.image.title="Ada on Debian" \
org.opencontainers.image.description="Ada development environment on Debian." \
org.opencontainers.image.authors="Junde Yhi <junde@yhi.moe>"
