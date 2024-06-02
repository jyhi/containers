<!--
  SPDX-FileCopyrightText: 2024 Junde Yhi <junde@yhi.moe>
  SPDX-License-Identifier: CC0-1.0
-->

# Freedesktop SDK Ada Extension with GNAT 14

This folder contains necessary files to repack an GNAT-14-based Ada development environment into an extention to the `org.freedesktop.Sdk` Flatpak container image.

## Includes

- GNAT-FSF (Ada/GCC) 14.x
- GNATprove (SPARK) 14.x
- GPRbuild latest
- Alire (`alr`) latest

So far the manifest simply downloads pre-built binaries from [alire-project/GNAT-FSF-builds](https://github.com/alire-project/GNAT-FSF-builds/releases) and [alire-project/alire](https://github.com/alire-project/alire).

## License

The metadata files included in this folder are public domain work under the CC0 1.0 license. See [CC0-1.0.txt](./LICENSES/CC0-1.0.txt) for a copy of the license text.
