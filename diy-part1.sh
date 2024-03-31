#!/bin/bash
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#
# Modify default IP
sed -i 's/192.168.1.1/192.168.10.1/g' package/base-files/files/bin/config_generate
#
# Modify default theme
#sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci/Makefile
#
echo '添加Passwall依赖feeds'
sed -i '1 i src-git-full passwall https://github.com/xiaorouji/openwrt-passwall-packages;main' feeds.conf.default
#
# echo 'src-git passwall2 https://github.com/xiaorouji/openwrt-passwall2.git' >>feeds.conf.default
# echo 'src-git passwall_packages https://github.com/xiaorouji/openwrt-passwall.git' >>feeds.conf.default
# echo 'src-git passwall_packages https://github.com/xiaorouji/openwrt-passwall-packages.git' >>feeds.conf.default
# echo 'src-git Openclash https://github.com/vernesong/OpenClash' >>feeds.conf.default
echo '=========Add passwall feeds source OK!========='
