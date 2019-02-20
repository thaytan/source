#
# Copyright (C) 2019 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=librtmp
PKG_VERSION:=2.4_p20151223
PKG_RELEASE:=1

PKG_SOURCE:=rtmpdump-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://gstreamer.freedesktop.org/data/src/mirror/
PKG_HASH:=b066f2583fd20aeb7b9c48535027e28026f8a38bc00d446fc81e09a597f38654

PKG_LICENSE:=GPL-2.0+
PKG_LICENSE_FILES:=COPYING
PKG_BUILD_PARALLEL:=0
PKG_BUILD_DIR:=$(BUILD_DIR)/rtmpdump-$(PKG_VERSION)

include $(INCLUDE_DIR)/package.mk

define Package/librtmp
  SECTION:=libs
  CATEGORY:=Libraries
  TITLE:=RTMP support library
  URL:=https://rtmpdump.mplayerhq.hu/
  DEPENDS:= +libnettle +libgnutls +zlib 
endef

TARGET_CFLAGS += $(FPIC)

define Build/Compile
	$(call Build/Compile/Default, \
		DESTDIR="$(PKG_INSTALL_DIR)" \
		CC="$(TARGET_CC)" \
		CRYPTO=GNUTLS \
		SYS=posix \
		prefix=/usr \
		XLDFLAGS="$(TARGET_LDFLAGS)" \
		XCFLAGS="$(TARGET_CFLAGS)" \
		LD="$(TARGET_LD)"
	+$(MAKE) $(PKG_JOBS) -C $(PKG_BUILD_DIR) \
		DESTDIR="$(PKG_INSTALL_DIR)" \
		CC="$(TARGET_CC)" \
		CRYPTO=GNUTLS \
		SYS=posix \
		prefix=/usr \
		XLDFLAGS="$(TARGET_LDFLAGS)" \
		XCFLAGS="$(TARGET_CFLAGS)" \
		LD="$(TARGET_LD)" \
		install)
endef

define Build/InstallDev
	$(INSTALL_DIR) $(1)/usr/include/librtmp
	$(CP) $(PKG_INSTALL_DIR)/usr/include/librtmp/*.h $(1)/usr/include/librtmp/
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/librtmp.{a,so*} $(1)/usr/lib/
	$(INSTALL_DIR) $(1)/usr/lib/pkgconfig
	$(CP) \
		$(PKG_INSTALL_DIR)/usr/lib/pkgconfig/librtmp.pc \
		$(1)/usr/lib/pkgconfig/
endef

define Package/librtmp/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/librtmp.so.* $(1)/usr/lib/
endef

$(eval $(call BuildPackage,librtmp))
