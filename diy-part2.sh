#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#

# Modify default IP
sed -i 's/192.168.1.1/192.168.2.1/g' package/base-files/files/bin/config_generate
#sed -i 's/KERNEL_PATCHVER:=5.15/KERNEL_PATCHVER:=6.1/g' target/linux/x86/Makefile
#sed -i "s/.*PKG_VERSION:=.*/PKG_VERSION:=4.3.9_v1.2.14/" package/lean/qBittorrent-static/Makefile
#sed -i "s/.*PKG_VERSION:=.*/PKG_VERSION:=5.0.0-stable/" package/libs/wolfssl/Makefile
# welcome test

# 修改默认IP
#sed -i 's/192.168.1.1/192.168.2.1/g' package/base-files/files/bin/config_generate

# 删除默认密码
#sed -i "/CYXluq4wUazHjmCDBCqXF/d" package/lean/default-settings/files/zzz-default-settings

# 修改默认主题
sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' ./feeds/luci/collections/luci/Makefile

# 取消bootstrap为默认主题
#sed -i '/set luci.main.mediaurlbase=\/luci-static\/bootstrap/d' feeds/luci/themes/luci-theme-bootstrap/root/etc/uci-defaults/30_luci-theme-bootstrap

# 修改主机名称
#sed -i 's/OpenWrt/HIWIFI-HC5962/g' package/base-files/files/bin/config_generate

# 修改版本号
sed -i "s/OpenWrt /MOLUN build $(TZ=UTC-8 date "+%Y.%m.%d") @ OpenWrt /g" package/lean/default-settings/files/zzz-default-settings

# 修改默认wifi名称ssid为tymishop
#sed -i 's/ssid=OpenWrt/ssid=tymishop/g' package/kernel/mac80211/files/lib/wifi/mac80211.sh

#开启MU-MIMO
#sed -i 's/mu_beamformer=0/mu_beamformer=1/g' package/kernel/mac80211/files/lib/wifi/mac80211.sh

#wifi加密方式，没有是none
sed -i 's/encryption=none/encryption=psk2/g' package/kernel/mac80211/files/lib/wifi/mac80211.sh

#wifi密码
#sed -i 's/key=15581822425/key=gds.2021/g' package/kernel/mac80211/files/lib/wifi/mac80211.sh

# Define My Package
#git clone https://github.com/vernesong/OpenClash package/molun/luci-app-openclash
#git clone https://github.com/jerrykuku/luci-app-jd-dailybonus package/molun/luci-app-jd-dailybonus
#git clone https://github.com/rufengsuixing/luci-app-adguardhome package/molun/luci-app-adguardhome
#git clone https://github.com/sirpdboy/luci-theme-opentopd package/molun/luci-theme-opentopd
#git clone https://github.com/zzsj0928/luci-app-pushbot package/molun/luci-app-pushbot
#git clone -b 18.06 https://github.com/kiddin9/luci-theme-edge package/molun/luci-theme-edge
#git clone -b 18.06 https://github.com/jerrykuku/luci-theme-argon package/molun/luci-theme-argon
#git clone https://github.com/jerrykuku/luci-app-argon-config package/molun/luci-app-argon-config
#git clone https://github.com/xiaoqingfengATGH/luci-theme-infinityfreedom package/molun/luci-theme-infinityfreedom
#git clone https://github.com/kenzok8/openwrt-packages.git package/openwrt-packages
#git clone https://github.com/thinktip/luci-theme-neobird package/molun/luci-theme-neobird
#git clone https://github.com/tracemouse/luci-theme-netgear package/molun/luci-theme-netgear

# 删除软件包
#rm -rf package/lean/luci-theme-argon
#rm -rf feeds/smpackage/{base-files,dnsmasq,firewall*,fullconenat,libnftnl,nftables,ppp,opkg,ucl,upx,vsftpd*,miniupnpd-iptables,wireless-regdb}
# Add kernel build user
[ -z $(grep "CONFIG_KERNEL_BUILD_USER=" .config) ] &&
    echo 'CONFIG_KERNEL_BUILD_USER="MOLUN"' >>.config ||
    sed -i 's@\(CONFIG_KERNEL_BUILD_USER=\).*@\1$"MOLUN"@' .config

# Add kernel build domain
[ -z $(grep "CONFIG_KERNEL_BUILD_DOMAIN=" .config) ] &&
    echo 'CONFIG_KERNEL_BUILD_DOMAIN="GitHub Actions"' >>.config ||
    sed -i 's@\(CONFIG_KERNEL_BUILD_DOMAIN=\).*@\1$"GitHub Actions"@' .config
