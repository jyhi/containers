<!--
  SPDX-FileCopyrightText: 2024 Junde Yhi <junde@yhi.moe>
  SPDX-License-Identifier: CC0-1.0
-->

# Intel® Quartus® Prime Lite Edition Design Software Version 23.1.1 for Linux (Flatpak)

> [!CAUTION]
> Files in this folder are obsolete. Newer versions of this project are at <https://github.com/jyhi/QuartusPrime-Flatpak>.

This folder contains necessary files to re-pack the Quartus Prime Design Software (Lite Edition) into Flatpak containers.

Under the restrictions of [Intel Terms of Use](https://www.intel.com/content/www/us/en/legal/terms-of-use.html), the scripts (manifests) are unable to automatically download all the required files to finish the Flatpak building process. The built Flatpaks are not hosted in any repository either. You must obtain the software installer programs and build the Flatpak(s) by yourself. See <https://www.intel.com/content/www/us/en/software-kit/825277/intel-quartus-prime-lite-edition-design-software-version-23-1-1-for-linux.html> for all the download options available from Intel.

## Build

Place the required file downloaded from the Intel website under the same folder as the `.yml` manifest; _Read The Friendly Source Code_ to figure out what is the required file. Then, run:

```sh
flatpak-builder --force-clean --install --user build com.example.Manifest.yml
```

Replace `com.example.Manifest.yml` with the name of the manifest file. This should build the container and install it for the current user.

## Permissions

By default, Quartus Prime Lite Edition (`com.intel.QuartusPrime.Lite`) is not given the permission to access any file or device on the host computer. You must explicitly enable them:

```sh
flatpak override --filesystem=host --device=all com.intel.QuartusPrime.Lite
```

For a full range of option that you can specify with the `flatpak override` command, refer to [flatpak-override(1)](https://docs.flatpak.org/en/latest/flatpak-command-reference.html#flatpak-override) manual page. Alternatively, you may want to use a GUI: [Flatseal](https://flathub.org/apps/com.github.tchx84.Flatseal).

The standalone Quartus Prime Programmer (`com.intel.QuartusPrime.Programmer`) is instead allowed to access all files (read-only) and devices on the host computer. This is to allow it to be usable out of the box.

## Includes

- Intel® Quartus® Software
  - Quartus® Prime (includes Nios II EDS): [`com.intel.QuartusPrime.Lite`](./Lite/com.intel.QuartusPrime.Lite.yml)
  - Questa - Intel® FPGA Starter Editions: [`com.intel.QuartusPrime.Lite.Questa.Starter`](./Lite/Questa/Starter/com.intel.QuartusPrime.Questa.Starter.yml)
- Devices
  - Arria® II device support: [`com.intel.QuartusPrime.Lite.Device.ArriaLite`](./Lite/Device/ArriaLite/com.intel.QuartusPrime.Lite.Device.ArriaLite.yml)
  - Cyclone® IV device support: [`com.intel.QuartusPrime.Lite.Device.Cyclone`](./Lite/Device/Cyclone/com.intel.QuartusPrime.Lite.Device.Cyclone.yml)
  - Cyclone® 10 LP device support: [`com.intel.QuartusPrime.Lite.Device.Cyclone10LP`](./Lite/Device/Cyclone10LP/com.intel.QuartusPrime.Lite.Device.Cyclone10LP.yml)
  - Cyclone® V device support: [`com.intel.QuartusPrime.Lite.Device.CycloneV`](./Lite/Device/CycloneV/com.intel.QuartusPrime.Lite.Device.CycloneV.yml)
  - MAX® II, MAX® V device support: [`com.intel.QuartusPrime.Lite.Device.Max`](./Lite/Device/Max/com.intel.QuartusPrime.Lite.Device.Max.yml)
  - MAX® 10 FPGA device support: [`com.intel.QuartusPrime.Lite.Device.Max10`](./Lite/Device/Max10/com.intel.QuartusPrime.Lite.Device.Max10.yml)
- Add-On Software
  - Intel® Quartus® Prime Help: [`com.intel.QuartusPrime.Lite.Help`](./Lite/Help/com.intel.QuartusPrime.Lite.Help.yml)
- Stand-Alone Software
  - Intel® Quartus® Prime Programmer and Tools: [`com.intel.QuartusPrime.Programmer`](./Programmer/com.intel.QuartusPrime.Programmer.yml)
  - Ashling RiscFree IDE for Intel® FPGAs: [`com.intel.QuartusPrime.RiscFree`](./RiscFree/com.intel.QuartusPrime.RiscFree.yml)

All `com.intel.QuartusPrime.Lite.*` Flatpaks extends `com.intel.QuartusPrime.Lite`. `com.intel.QuartusPrime.Programmer` and `com.intel.QuartusPrime.RiscFree` are packaged separately as they are designed to be standalone.

## License

The metadata files included in this repository are public domain work under the CC0 1.0 license. See [CC0-1.0.txt](../LICENSES/CC0-1.0.txt) for a copy of the license text.

The Intel® Quartus® Prime software is a proprietary software licensed under the Quartus Prime and Intel FPGA IP License Agreement. You can obtain a copy of the license text by extracting it from the Quartus Prime installer:

```sh
./QuartusLiteSetup-23.1std.1.993-linux.run --install_lic ./intelFPGA_lite/23.1std
```

This will place all the license documents under the `./intelFPGA_lite/23.1std/licenses` directory.
