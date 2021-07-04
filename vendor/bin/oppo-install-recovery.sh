#!/system/bin/sh
if ! applypatch --check EMMC:/dev/block/platform/bootdevice/by-name/recovery:67108864:5e2e1f7328e72f2f3a276b9e2a34199c40b70c4b; then
  applypatch  \
          --patch /vendor/recovery-from-boot.p \
          --source EMMC:/dev/block/platform/bootdevice/by-name/boot:33554432:6aa21e02ef0890f0be529302c547c8680b266330 \
          --target EMMC:/dev/block/platform/bootdevice/by-name/recovery:67108864:5e2e1f7328e72f2f3a276b9e2a34199c40b70c4b && \
      log -t recovery "Installing new oppo recovery image: succeeded" && \
      setprop ro.recovery.updated true || \
      log -t recovery "Installing new oppo recovery image: failed" && \
      setprop ro.recovery.updated false
else
  log -t recovery "Recovery image already installed"
  setprop ro.recovery.updated true
fi
