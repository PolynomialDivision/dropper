include $(TOPDIR)/rules.mk

PKG_NAME:=dropper
PKG_VERSION:=2020.11.24
PKG_RELEASE:=1

PKG_MAINTAINER:=Bla bla <bla@bla.com>

include $(INCLUDE_DIR)/package.mk

define Package/dropper
	SECTION:=net
	CATEGORY:=Network
	TITLE:=Dropper
	URL:=https://github.com/PolynomialDivision
	DEPENDS:=+libbpf
endef

define Build/Prepare
	mkdir -p $(PKG_BUILD_DIR)
	$(CP) ./src/* $(PKG_BUILD_DIR)/
endef

define Package/dropper/description
  try bpf
endef

define Package/dropper/install
	$(INSTALL_DIR) $(1)/usr/bpfstuff
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/xdp_loader $(1)/usr/bpfstuff/xdp_loader
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/xdp_stats $(1)/usr/bpfstuff/xdp_stats
endef

$(eval $(call BuildPackage,dropper))
