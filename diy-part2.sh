#!/bin/bash
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#
# Copyright (c) 2019-2024 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# 适用源码: immortalwrt/immortalwrt 分支 openwrt-24.10 (基于 cmcc_rax3000m 适配 XR30)

# 1) Modify default IP -> 192.168.8.1
sed -i 's/192.168.1.1/192.168.8.1/g' package/base-files/files/bin/config_generate

# 2) 适配 XR30 灯光: 官方 24.10 DTS 在 target/linux/mediatek/dts/
#    RAX3000M: 绿 pio9 / 蓝 pio12 / 红 pio35
#    XR30:     白 pio34 / 红 pio35  (红灯相同, 仅改状态灯)
DTS="target/linux/mediatek/dts/mt7981b-cmcc-rax3000m.dts"
if [ -f "$DTS" ]; then
  # 状态灯: 绿(pio9) -> 白(pio34)
  sed -i \
    -e 's|color = <LED_COLOR_ID_GREEN>;|color = <LED_COLOR_ID_WHITE>;|' \
    -e 's|gpios = <&pio 9 GPIO_ACTIVE_LOW>;|gpios = <&pio 34 GPIO_ACTIVE_LOW>;|' \
    "$DTS"
  # 删除多余的蓝灯(pio12)块
  perl -0777 -i -pe 's/\t\tled-1 \{.*?\n\t\t\};//s' "$DTS"
fi
