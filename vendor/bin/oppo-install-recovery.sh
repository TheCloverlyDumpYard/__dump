#!/system/bin/sh
if ! applypatch --check EMMC:/dev/block/platform/bootdevice/by-name/recovery:67108864:887cf8baed54890e4466081c5b3c999c7206a5f7; then
  applypatch  \
          --patch /vendor/recovery-from-boot.p \
          --source EMMC:/dev/block/platform/bootdevice/by-name/boot:33554432:693622664103c2a6648971e695ea3391122e0fcc \
          --target EMMC:/dev/block/platform/bootdevice/by-name/recovery:67108864:887cf8baed54890e4466081c5b3c999c7206a5f7 && \
      log -t recovery "Installing new oppo recovery image: succeeded" && \
      setprop ro.recovery.updated true || \
      log -t recovery "Installing new oppo recovery image: failed" && \
      setprop ro.recovery.updated false
else
  log -t recovery "Recovery image already installed"
  setprop ro.recovery.updated true
fi
