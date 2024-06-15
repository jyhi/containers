# SPDX-FileCopyrightText: 2024 Junde Yhi <junde@yhi.moe>
# SPDX-License-Identifier: GPL-3.0-or-later

PODMAN ?= podman
REPOSITORY = ghcr.io/jyhi/ada-debian
REPOSITORY_U = ghcr_io_jyhi_ada_debian
TAG = latest
NAME = $(REPOSITORY):$(TAG)
FILE_NAME = $(REPOSITORY_U)_$(TAG).tar

.PHONY: all dist clean distclean

all: .built

dist: $(FILE_NAME)

clean:
	$(RM) $(FILE_NAME) .built

distclean: clean
	$(PODMAN) rmi --force $(NAME)
	$(PODMAN) rmi --force debian

.built: Containerfile
	$(PODMAN) build --tag $(NAME) --file - < $<
	touch $@

$(FILE_NAME): .built
	$(PODMAN) save --format oci-archive --output $@ $<
