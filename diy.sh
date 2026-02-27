########### 更改大雕源码（可选）#########
# sed -i 's/KERNEL_PATCHVER:=5.15/KERNEL_PATCHVER:=6.12/g' ./target/linux/x86/Makefile
# sed -i 's/KERNEL_PATCHVER:=6.1/KERNEL_PATCHVER:=6.12/g' ./target/linux/x86/Makefile
sed -i 's/KERNEL_PATCHVER:=6.6/KERNEL_PATCHVER:=6.12/g' ./target/linux/x86/Makefile
# 2. 更新 LuCI 源
# sed -i 's|src-git luci.*|src-git luci https://github.com/coolsnowwolf/luci.git;openwrt-24.10|' feeds.conf.default

# src-git luci https://github.com/coolsnowwolf/luci.git;openwrt-24.10
# sed -i '/openwrt-23.05/d' feeds.conf.default
# sed -i 's/^#\(.*luci\)/\1/' feeds.conf.default


# 修改ip地址为192.168.5.1
# sed -i 's/192.168.1.1/192.168.5.1/g' package/base-files/files/bin/config_generate
sed -i 's/192.168.1.1/192.168.5.1/g' package/base-files/luci2/bin/config_generate

# 2.清除登录密码
sed -i "/CYXluq4wUazHjmCDBCqXF/d" package/lean/default-settings/files/zzz-default-settings

# 修改主机名字，把OpenWrt-123修改你喜欢的就行（不能纯数字或者使用中文）
sed -i '/uci commit system/i\uci set system.@system[0].hostname='OpenWrt'' package/lean/default-settings/files/zzz-default-settings


# 版本号里显示一个自己的名字（281677160 build $(TZ=UTC-8 date "+%Y.%m.%d") @ 这些都是后增加的）
sed -i "s/LEDE /OpenWrt ($(TZ=UTC-8 date "+%Y.%m.%d") compiled by cheery)/g" package/lean/default-settings/files/zzz-default-settings

# 更换默认主题
sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci/Makefile

# ======================== 时间显示中文数字 ========================
 # 替换状态页本地时间为中文数字
 sed -i 's/translate_date_time.*/translate_date_time() {}/g' feeds/luci/modules/luci-base/luasrc/tools/status.lua 2>/dev/null
 sed -i '/"year"/s/os.date()/os.date("%Y年%m月%d日 %H:%M:%S")/g' feeds/luci/modules/luci-base/luasrc/tools/status.lua 2>/dev/null

# 调整 x86 型号只显示 CPU 型号
sed -i 's/${g}.*/${a}${b}${c}${d}${e}${f}/g' package/lean/autocore/files/x86/autocore

# 设置ttyd免帐号登录
# sed -i 's/\/bin\/login/\/bin\/login -f root/' feeds/packages/utils/ttyd/files/ttyd.config


# 把curl退到8.5.0
# rm -rf feeds/packages/net/curl
# git clone https://github.com/sbwml/feeds_packages_net_curl feeds/packages/net/curl

# 移除 openwrt feeds 自带的核心包
# rm -rf feeds/packages/net/{xray-core,v2ray-core,v2ray-geodata,sing-box}
# git clone https://github.com/sbwml/openwrt_helloworld package/helloworld
# 更新 golang 1.22 版本
# rm -rf feeds/packages/lang/golang
# git clone https://github.com/sbwml/packages_lang_golang -b 22.x feeds/packages/lang/golang

# 删除自带插件
# rm -rf ./package/lean/luci-app-qbittorrent
rm -rf ./feeds/luci/themes/luci-theme-argon
# rm -rf ./package/lean/luci-app-nlbwmon
rm -rf ./package/lean/luci-app-netdata
# rm -rf ./package/lean/luci-app-wrtbwmon
# rm -rf ./package/lean/luci-app-serverchan
# rm -rf ./feeds/packages/net/adguardhome
# rm -rf ./feeds/packages/net/https-dns-proxy
# rm -rf ./feeds/diy/openwrt-adguardhome
rm -rf feeds/luci/themes/luci-theme-argon
rm -rf feeds/luci/applications/luci-app-argon-config

#添加独立软件

#商城
#git clone https://github.com/linkease/istore.git package/istore

# git clone https://github.com/esirplayground/luci-app-poweroff.git package/luci-app-poweroff

#sirpdboy
#git clone https://github.com/sirpdboy/sirpdboy-package.git package/sirpdboy-package
#git clone https://github.com/sirpdboy/luci-theme-opentopd.git package/luci-theme-opentopd
#git clone https://github.com/sirpdboy/luci-app-advanced.git package/luci-app-advanced
#git clone https://github.com/sirpdboy/netspeedtest.git package/netspeedtest
# rm -rf ./package/lean/luci-app-netdata
# git clone https://github.com/sirpdboy/luci-app-netdata.git package/luci-app-netdata
#git clone https://github.com/sirpdboy/luci-app-poweroffdevice.git package/luci-app-poweroffdevice
#git clone https://github.com/sirpdboy/luci-app-autotimeset.git package/luci-app-autotimeset
# git clone https://github.com/iwrt/luci-app-ikoolproxy.git package/luci-app-ikoolproxy
# git clone https://github.com/small-5/luci-app-adblock-plus.git package/luci-app-adblock-plus
# git clone https://github.com/kiddin9/luci-app-dnsfilter.git package/luci-app-dnsfilter
# git clone https://github.com/kiddin9/openwrt-bypass.git package/openwrt-bypass

#添加额外非必须软件包
# git clone https://github.com/rufengsuixing/luci-app-adguardhome.git package/luci-app-adguardhome
# git clone https://github.com/vernesong/OpenClash.git package/OpenClash
# git clone https://github.com/destan19/OpenAppFilter.git package/OpenAppFilter
# git clone https://github.com/zzsj0928/luci-app-pushbot.git package/luci-app-pushbot
# git clone https://github.com/riverscn/openwrt-iptvhelper.git package/openwrt-iptvhelper
# git clone https://github.com/jerrykuku/luci-app-jd-dailybonus.git package/luci-app-jd-dailybonus
#添加smartdns
# git clone https://github.com/pymumu/openwrt-smartdns package/smartdns
# git clone -b lede https://github.com/pymumu/luci-app-smartdns.git package/luci-app-smartdns

# echo 'src-git kenzo https://github.com/kenzok8/openwrt-packages' >>feeds.conf.default
# echo 'src-git kenzo1 https://github.com/kenzok8/jell' >>feeds.conf.default


# sed -i '$a src-git lienol https://github.com/Lienol/openwrt-package' feeds.conf.default
# sed -i '$a src-git jerryk https://github.com/jerrykuku/openwrt-package' feeds.conf.default
# sed -i '$a src-git ssr https://github.com/fw876/helloworld' feeds.conf.default
# sed -i '$a src-git passwall https://github.com/xiaorouji/openwrt-passwall' feeds.conf.default
# git clone https://github.com/iwrt/luci-app-ikoolproxy.git package/luci-app-ikoolproxy
git clone https://github.com/esirplayground/luci-app-poweroff.git package/luci-app-poweroff
# git clone https://github.com/sirpdboy/luci-app-netdata.git package/luci-app-netdata
git clone https://github.com/firker/diy-ziyong -b 2305 package/diy-ziyong
git clone https://github.com/jerrykuku/luci-theme-argon.git package/luci-theme-argon
git clone https://github.com/jerrykuku/luci-app-argon-config.git package/luci-app-argon-config
# git clone https://github.com/linkease/istore.git package/istore
# git clone https://github.com/ElvenP/luci-app-onliner.git package/luci-app-onliner

# git clone https://github.com/sirpdboy/sirpdboy-package.git package/sirpdboy-package

#passwall
#git clone https://github.com/xiaorouji/openwrt-passwall-packages.git package/openwrt-passwall
#git clone https://github.com/xiaorouji/openwrt-passwall.git package/luci-app-passwall

git clone https://github.com/Openwrt-Passwall/openwrt-passwall-packages.git package/openwrt-passwall
git clone https://github.com/Openwrt-Passwall/openwrt-passwall.git package/luci-app-passwall

# git clone -b luci-smartdns-dev https://github.com/xiaorouji/openwrt-passwall.git package/luci-app-passwall


# Go 1.21 updates
# rm -rf package/openwrt-passwall/brook
# rm -rf package/openwrt-passwall/v2ray-core
# svn export https://github.com/immortalwrt/packages/trunk/net/brook feeds/packages/net/brook
# ln -sf ../../../feeds/packages/net/brook ./package/feeds/packages/brook
# svn export https://github.com/immortalwrt/packages/trunk/net/v2ray-core feeds/packages/net/v2ray-core
# ln -sf ../../../feeds/packages/net/v2ray-core ./package/feeds/packages/v2ray-core



#passwall2
# git clone https://github.com/xiaorouji/openwrt-passwall-packages.git package/openwrt-passwall
# git clone https://github.com/xiaorouji/openwrt-passwall2.git package/luci-app-passwall2

#helloword
# git clone https://github.com/jerrykuku/luci-app-vssr.git package/luci-app-vssr
# git clone https://github.com/jerrykuku/lua-maxminddb.git package/lua-maxminddb
# git clone https://github.com/fw876/helloworld.git package/helloworld


#smartdns
# git clone https://github.com/firkerword/luci-app-smartdns.git package/luci-app-smartdns
# git clone https://github.com/firkerword/smartdns.git package/smartdns
# git clone -b lede https://github.com/pymumu/luci-app-smartdns.git package/luci-app-smartdns

# sed -i '$a src-git bypass https://github.com/garypang13/openwrt-bypass' feeds.conf.default
# git clone -b master https://github.com/vernesong/OpenClash.git package/OpenClash
# svn co https://github.com/vernesong/OpenClash/trunk/luci-app-openclash package/luci-app-openclash
# git clone https://github.com/tty228/luci-app-serverchan.git package/luci-app-serverchan
# git clone https://github.com/sirpdboy/luci-theme-opentopd.git package/luci-theme-opentopd
# svn co https://github.com/messense/aliyundrive-webdav/trunk/openwrt package/aliyundrive-webdav
# git clone https://github.com/garypang13/luci-app-dnsfilter.git package/luci-app-dnsfilter
# git clone https://github.com/BCYDTZ/luci-app-UUGameAcc.git package/luci-app-UUGameAcc

# rm -rf feeds/packages/lang/golang
# svn export https://github.com/sbwml/packages_lang_golang/branches/20.x feeds/packages/lang/golang

# luci-app-lucky=y 
# git clone https://github.com/firkerword/luci-app-lucky.git package/lucky
git clone  https://github.com/gdy666/luci-app-lucky.git package/lucky
# git clone https://github.com/sirpdboy/luci-app-lucky.git package/lucky
chmod 755 ./package/lucky/luci-app-lucky/root/usr/bin/luckyarch
