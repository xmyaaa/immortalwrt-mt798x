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

# Modify default IP
sed -i 's/192.168.1.1/192.168.10.1/g' package/base-files/files/bin/config_generate

# Modify default theme
#sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci/Makefile

# Modify hostname
#sed -i 's/OpenWrt/P3TERX-Router/g' package/base-files/files/bin/config_generate

echo '替换jerrykuku的luci argon主题'
#rm -rf feeds/luci/themes/luci-theme-argon
#git clone -b master --single-branch https://github.com/jerrykuku/luci-theme-argon feeds/luci/themes/luci-theme-argon
echo '=========Replace luci theme argon OK!========='

echo '替换golang到1.22.x'
rm -rf feeds/packages/lang/golang
git clone -b 22.x --single-branch https://github.com/sbwml/packages_lang_golang feeds/packages/lang/golang
echo '=========Replace golang OK!========='

echo '替换Passwall软件'
#rm -rf feeds/luci/applications/luci-app-passwall
#git clone -b main --single-branch https://github.com/xiaorouji/openwrt-passwall feeds/luci/applications/luci-app-passwall
#mv feeds/luci/applications/luci-app-passwall/luci-app-passwall/* feeds/luci/applications/luci-app-passwall/
#rm -rf feeds/luci/applications/luci-app-passwall/luci-app-passwall
echo '=========Replace passwall source OK!========='

echo '修改Passwall检测规则'
#sed -i 's/socket" "iptables-mod-//g' feeds/luci/applications/luci-app-passwall/root/usr/share/passwall/app.sh
echo '=========ALTER passwall denpendcies check OK!========='

echo '修改主机名'
sed -i "s/hostname='ImmortalWrt'/hostname='RAX3000M'/g" package/base-files/files/bin/config_generate
cat package/base-files/files/bin/config_generate |grep hostname=
echo '=========Alert hostname OK!========='

# echo '开启sing-box的CGO标记'
# sed -i 's/CGO_ENABLED=0/CGO_ENABLED=1/g' feeds/passwall/sing-box/Makefile
# echo '=========Enable sing-box CGO FLAG OK !========='
