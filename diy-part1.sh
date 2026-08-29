#!/bin/bash
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)
#
# Copyright (c) 2019-2024 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# 适用源码: immortalwrt/immortalwrt 分支 openwrt-24.10
# 说明: 官方 24.10 本身无 passwall，无需删 feed；仅追加 3 个第三方 feed。

# Add qmodem feed (5G 模组管理)
echo 'src-git qmodem https://github.com/BootLoopLover/qmodem.git' >> feeds.conf.default

# Add openclash feed
echo 'src-git openclash https://github.com/vernesong/OpenClash.git' >> feeds.conf.default

# Add luci-app-diskman feed (硬盘挂载管理)
echo 'src-git diskman https://github.com/lisaac/luci-app-diskman.git' >> feeds.conf.default
