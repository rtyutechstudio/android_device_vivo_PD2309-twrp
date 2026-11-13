# TWRP Device Tree for vivo X100 (PD2309)

Welcome to the TWRP (Team Win Recovery Project) device tree repository for the **vivo X100 (codename: PD2309)**. This tree targets the MediaTek Dimensity 9300 platform and is intended for use with TWRP 14.0 sources.

## Device Specifications

| Feature | Details |
| ---- | ---- |
| Codename | PD2309 |
| Model | vivo X100 |
| Chipset | MediaTek Dimensity 9300 (MT6989) |
| CPU | Octa-core (1×3.25 GHz Cortex-X4 + 3×2.85 GHz Cortex-X4 + 4×2.00 GHz Cortex-A720) |
| GPU | Immortalis-G720 |
| RAM | 12GB / 16GB LPDDR5X / LPDDR5T |
| Storage | 256GB / 512GB / 1TB UFS 4.0 |
| Battery | 5000mAh Li-Po (dual-cell, 120W fast charging) |
| Display | 6.78 inches, LTPO AMOLED, 2800 × 1260 pixels, 120Hz |
| Rear Camera | 50MP (OIS) + 50MP ultrawide + 64MP periscope telephoto (OIS, 3× optical) |
| Front Camera | 32MP |
| Platform | MediaTek |

## Device picture

![vivo X100](https://wwwstatic.vivo.com.cn/vivoportal/files/resource/product/1767669982753/images/pc/color4.png.webp)

## Compatibility

- Built for **TWRP 14.0** (Android 14 base)
- Compatible with **vivo X100 (PD2309)** only
- Designed to work with stock Android 14 / 15 / 16 firmware for PD2309
- **MediaTek platform** — no Unisoc/Spreadtrum patches are required or included

## Features

### Working

- ✅ ADB access
- ✅ Decryption (stock Android 14 keystore)
- ✅ Touchscreen
- ✅ Internal storage / SD card mount
- ✅ Backup & Restore
- ✅ Flashing ZIP/IMG files
- ✅ Reboot to system/recovery/bootloader
- ✅ Vibration
- ✅ USB-OTG

### Not Working

- ✅  None (full functional TWRP for supported firmware)

## Build Instructions

### 1. Initialize TWRP Source

```bash
repo init --depth=1 -u https://github.com/nebrassy/platform_manifest_twrp_aosp.git -b twrp-14.0
```

### 2. Sync Source

```bash
repo sync -j$(nproc --all) --force-sync
```

### 3. Clone Device Tree

```bash
git clone https://github.com/rtyutechstudio/android_device_vivo_PD2309-twrp device/vivo/PD2309
```

### 4. Build Recovery Image

```bash
source build/envsetup.sh
lunch twrp_PD2309-ap2a-eng
mka vendorbootimage
```


## Output Location

After a successful build, the recovery image will be generated at:

```
out/target/product/PD2309/vendor_boot.img
```

## Installation Instructions

### Prerequisites

- Unlocked bootloader
- Fastboot installed on PC
- USB debugging & OEM unlocking enabled

### Flash via Fastboot

```bash
fastboot flash recovery recovery.img
fastboot reboot recovery
```

## Notes

- This device tree is **only for the vivo X100 (PD2309)**. Do not flash it on any other vivo or MediaTek device.
- **Backup all data** before flashing a custom recovery.
- Decryption relies on the stock Android 14 keystore for PD2309. Compatibility with later firmware may vary.
- No Unisoc/Spreadtrum patches are applied; this tree is built specifically for the MediaTek Dimensity 9300 platform.

## Credits

- TWRP Team for the recovery source
- nebrassy for the TWRP 14.0 manifest
- rtyutechstudio for the PD2309 device tree
- Contributors to vivo X100 development