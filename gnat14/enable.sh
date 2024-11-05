#!/bin/sh
# SPDX-FileCopyrightText: 2024 Junde Yhi <junde@yhi.moe>
# SPDX-License-Identifier: CC0-1.0

# Stop Alire from interactively asking for a selection of toolchain.
/usr/lib/sdk/gnat14/bin/alr toolchain --disable-assistant > /dev/null

export PATH="/usr/lib/sdk/gnat14/bin:$PATH"
