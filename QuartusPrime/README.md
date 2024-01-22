<!--
  SPDX-FileCopyrightText: 2024 Junde Yhi <junde@yhi.moe>
  SPDX-License-Identifier: CC0-1.0
-->

# Intel® Quartus® Prime Lite Edition Design Software Version 23.1 for Linux (Flatpak)

This folder contains necessary files to re-pack the Quartus Prime Design Software (Lite Edition) into Flatpak containers.

Under the restrictions of [Intel Terms of Use](https://www.intel.com/content/www/us/en/legal/terms-of-use.html), the scripts (manifests) are unable to automatically download all the required files to finish the Flatpak building process. The built Flatpaks are not hosted in any repository either. You must obtain the software installer programs and build the Flatpak(s) by yourself. See <https://www.intel.com/content/www/us/en/software-kit/795187/intel-quartus-prime-lite-edition-design-software-version-23-1-for-linux.html> for all the download options available from Intel.

Place the required file(s) under the same folder as the `.yml` manifest, then run:

```sh
flatpak-builder --sandbox --user --install --force-clean build com.intel.QuartusPrime.Lite.yml
```

This should build the container and install it to the current user.

## Includes

- Intel® Quartus® Software
  - Quartus® Prime (includes Nios II EDS): [com.intel.QuartusPrime.Lite](./Lite/com.intel.QuartusPrime.Lite.yml)
  - Questa - Intel® FPGA and Starter Editions: (work in progress)
- Devices
  - Arria® II device support: (work in progress)
  - Cyclone® IV device support: (work in progress)
  - Cyclone® 10 LP device support: (work in progress)
  - Cyclone® V device support: (work in progress)
  - MAX® II, MAX® V device support: (work in progress)
  - MAX® 10 FPGA device support: (work in progress)
- Add-On Software
  - Intel® Quartus® Prime Help: (work in progress)
- Stand-Alone Software
  - Intel® Quartus® Prime Programmer and Tools: (work in progress)
  - Ashling RiscFree IDE for Intel® FPGAs: (work in progress)

## License

The metadata files included in this repository are public domain work under the CC0 1.0 license. See [CC0-1.0.txt](../LICENSES/CC0-1.0.txt) for a copy of the license text.

The Intel® Quartus® Prime software is a proprietary software licensed under the Quartus Prime and Intel FPGA IP License Agreement. You can obtain a copy of the license text by extracting it from the installer. For example:

```sh
./QuartusLiteSetup-23.1std.0.991-linux.run --install_lic ./QuartusPrimeLicenses/
```

This will place all the license documents under the `QuartusPrimeLicenses` directory.
