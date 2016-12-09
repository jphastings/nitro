# Nitro

Uncrackable encryption for files on your USB devices using one-time pad technology - provided by [Nitroglycerin](https://github.com/jphastings/nitroglycerin.ex).

Burn this application to an SD card and run it on your Raspberry Pi for a hardware device that will turn your USB drive into something only you (or someone with your pad disk) can ever decypher.

## Installation

```bash
# To get the project dependencies and compile it:
$ mix deps.get
$ mix compile
# To create & burn the application disk image to an SD card for your Pi:
$ mix firmware
$ mix firmware.burn
```
If you are building to run on qemu:

```bash
mix compile &&
mix firmware &&
fwup -a -d _images/qemu_arm/nitro.img -i _images/qemu_arm/nitro.fw -t complete &&
qemu-system-arm \
-M vexpress-a9 \
-smp 1 \
-m 256 \
-kernel _build/qemu_arm/dev/nerves/system/images/zImage \
-dtb _build/qemu_arm/dev/nerves/system/images/vexpress-v2p-ca9.dtb \
-drive file=_images/qemu_arm/nitro.img,if=sd,format=raw \
-drive file=_images/pad_disk.img,if=sd,format=raw \
-append "console=ttyAMA0,115200 root=/dev/mmcblk0p2" \
-serial stdio \
-net none
```
