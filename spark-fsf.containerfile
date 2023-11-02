# SPDX-FileCopyrightText: 2023 Junde Yhi <junde@yhi.moe>
# SPDX-License-Identifier: GPL-3.0-or-later

# Use a separate container to download and extract artifacts, but use the same base OS to avoid
# unnecessary extra downloads.
FROM debian:12 AS downloads

ARG GNAT_VER="13.2.0-1"
ARG GNATPROVE_VER="12.1.0-1"
ARG ALIRE_VER="1.2.2"

# unzip is required but not present in the base OS image.
# Alire depends on cURL and Git to download packages.
RUN apt-get update && apt-get install -y unzip curl git && rm -rf /var/lib/apt/lists/*

# Download compiler builds and the Alire package manager.
ADD https://github.com/alire-project/GNAT-FSF-builds/releases/download/gnat-${GNAT_VER}/gnat-x86_64-linux-${GNAT_VER}.tar.gz /downloads/
ADD https://github.com/alire-project/GNAT-FSF-builds/releases/download/gnatprove-${GNATPROVE_VER}/gnatprove-x86_64-linux-${GNATPROVE_VER}.tar.gz /downloads/
ADD https://github.com/alire-project/alire/releases/download/v${ALIRE_VER}/alr-${ALIRE_VER}-bin-x86_64-linux.zip /downloads/

# Extract GNAT, GNATprove and Alire to /opt.
WORKDIR /opt
RUN tar -xf /downloads/gnat-x86_64-linux-${GNAT_VER}.tar.gz
RUN tar -xf /downloads/gnatprove-x86_64-linux-${GNATPROVE_VER}.tar.gz

# The Alire archive does not have a top-level directory; we simulate it here.
WORKDIR /opt/alire-x86_64-linux-${ALIRE_VER}
RUN unzip /downloads/alr-${ALIRE_VER}-bin-x86_64-linux.zip

# This is the final production container.
FROM debian:12

# Only copy the necessary files into this container.
COPY --from=downloads /opt /opt

# Add the tools to $PATH.
ENV PATH="/opt/gnat-x86_64-linux-${GNAT_VER}/bin:/opt/gnatprove-x86_64-linux-${GNATPROVE_VER}/bin:/opt/alire-x86_64-linux-${ALIRE_VER}/bin:$PATH"

# Alire adjustments. Alire depends on cURL and Git to download packages.
RUN apt-get update && apt-get install -y curl git && rm -rf /var/lib/apt/lists/*
RUN alr toolchain --disable-assistant

LABEL \
org.opencontainers.image.title="SPARK-GNAT-FSF" \
org.opencontainers.image.description="SPARK/Ada development environment based on Alire Project builds." \
org.opencontainers.image.authors="Junde Yhi <junde@yhi.moe>"
