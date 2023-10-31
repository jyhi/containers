# SPDX-FileCopyrightText: 2023 Junde Yhi <junde@yhi.moe>
# SPDX-License-Identifier: GPL-3.0-or-later

FROM debian

RUN apt-get update --yes && \
apt-get install --yes gnat gprbuild && \
rm -rf /var/lib/apt/lists/*

LABEL \
org.opencontainers.image.title="GNAT-FSF (Debian)" \
org.opencontainers.image.description="The GNU Ada compiler shipped with Debian." \
org.opencontainers.image.source="https://github.com/jyhi/containers/blob/main/gnat-fsf-debian.containerfile" \
org.opencontainers.image.authors="Junde Yhi <junde@yhi.moe>"
