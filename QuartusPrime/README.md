<!--
  SPDX-FileCopyrightText: 2024 Junde Yhi <junde@yhi.moe>
  SPDX-License-Identifier: CC0-1.0
-->

# Intel® Quartus® Prime Lite Edition Design Software Version 23.1 for Linux (Flatpak)

This folder contains necessary files to re-pack the Quartus Prime Design Software (Lite Edition) into Flatpak containers.

Under the restrictions of [Intel Terms of Use](https://www.intel.com/content/www/us/en/legal/terms-of-use.html), the scripts (manifests) are unable to automatically download all the required files to finish the Flatpak building process. The built Flatpaks are not hosted in any repository either. You must obtain the software installer programs and build the Flatpak(s) by yourself. See <https://www.intel.com/content/www/us/en/software-kit/795187/intel-quartus-prime-lite-edition-design-software-version-23-1-for-linux.html> for all the download options available from Intel.

_Read The Friendly Source Code_ to figure out the required files for building a Flatpak. Place the required file(s) under the same folder as the `.yml` manifest, then run:

```sh
flatpak-builder --force-clean --install --user build com.example.Manifest.yml
```

Replace `com.example.Manifest.yml` with the name of manifest file describing the Flatpak you want. This should build the container and install it for the current user.

## Includes

- Intel® Quartus® Software
  - Quartus® Prime (includes Nios II EDS): [com.intel.QuartusPrime.Lite](./Lite/com.intel.QuartusPrime.Lite.yml)
  - Questa - Intel® FPGA and Starter Editions: [com.intel.QuartusPrime.Questa.Starter](./Questa/Starter/com.intel.QuartusPrime.Questa.Starter.yml)
- Devices
  - Arria® II device support: [com.intel.QuartusPrime.Lite.Device.ArriaLite](./Lite/Device/ArriaLite/com.intel.QuartusPrime.Lite.Device.ArriaLite.yml)
  - Cyclone® IV device support: [com.intel.QuartusPrime.Lite.Device.Cyclone](./Lite/Device/Cyclone/com.intel.QuartusPrime.Lite.Device.Cyclone.yml)
  - Cyclone® 10 LP device support: [com.intel.QuartusPrime.Lite.Device.Cyclone10LP](./Lite/Device/Cyclone10LP/com.intel.QuartusPrime.Lite.Device.Cyclone10LP.yml)
  - Cyclone® V device support: [com.intel.QuartusPrime.Lite.Device.CycloneV](./Lite/Device/CycloneV/com.intel.QuartusPrime.Lite.Device.CycloneV.yml)
  - MAX® II, MAX® V device support: [com.intel.QuartusPrime.Lite.Device.Max](./Lite/Device/Max/com.intel.QuartusPrime.Lite.Device.Max.yml)
  - MAX® 10 FPGA device support: [com.intel.QuartusPrime.Lite.Device.Max10](./Lite/Device/Max10/com.intel.QuartusPrime.Lite.Device.Max10.yml)
- Add-On Software
  - Intel® Quartus® Prime Help: [com.intel.QuartusPrime.Lite.Help](./Lite/Help/com.intel.QuartusPrime.Lite.Help.yml)
- Stand-Alone Software
  - Intel® Quartus® Prime Programmer and Tools: com.intel.QuartusPrime.Programmer (work in progress)
  - Ashling RiscFree IDE for Intel® FPGAs: com.intel.QuartusPrime.RiscFree (work in progress)

## License

The metadata files included in this repository are public domain work under the CC0 1.0 license. See [CC0-1.0.txt](../LICENSES/CC0-1.0.txt) for a copy of the license text.

The Intel® Quartus® Prime software is a proprietary software licensed under the Quartus Prime and Intel FPGA IP License Agreement. You can obtain a copy of the license text by extracting it from the Quartus Prime installer:

```sh
./QuartusLiteSetup-23.1std.0.991-linux.run --install_lic ./intelFPGA_lite/23.1std
```

This will place all the license documents under the `./intelFPGA_lite/23.1std/licenses` directory.
