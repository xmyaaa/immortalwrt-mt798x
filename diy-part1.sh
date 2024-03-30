#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)
#

# Uncomment a feed source
#sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default

echo '添加Passwall依赖feeds'
#sed -i '1 i src-git-full passwall https://github.com/xiaorouji/openwrt-passwall-packages;main' feeds.conf.default
#
#echo 'src-git passwall2 https://github.com/xiaorouji/openwrt-passwall2.git' >>feeds.conf.default
#echo 'src-git passwall https://github.com/xiaorouji/openwrt-passwall.git' >>feeds.conf.default
echo 'src-git passwall_packages https://github.com/xiaorouji/openwrt-passwall-packages.git' >>feeds.conf.default
#echo 'src-git Openclash https://github.com/vernesong/OpenClash' >>feeds.conf.default

echo '=========Add passwall feeds source OK!========='

# Add a feed source
#rm -rf package/helloworld
#git clone --depth=1 https://github.com/fw876/helloworld.git package/helloworld

# Add a feed source
echo 'src-git helloworld https://github.com/fw876/helloworld' >>feeds.conf.default
echo 'src-git passwall https://github.com/xiaorouji/openwrt-passwall' >>feeds.conf.default
