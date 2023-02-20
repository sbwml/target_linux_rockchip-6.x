# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2020 OpenWrt.org

define KernelPackage/drm-rockchip
  SUBMENU:=$(VIDEO_MENU)
  TITLE:=Rockchip DRM support
  DEPENDS:=@TARGET_rockchip +kmod-backlight +kmod-drm-kms-helper +kmod-multimedia-input
  KCONFIG:= \
	CONFIG_DRM_ROCKCHIP \
	CONFIG_DRM_LOAD_EDID_FIRMWARE=y \
	CONFIG_DRM_FBDEV_EMULATION=y \
	CONFIG_DRM_FBDEV_OVERALLOC=100 \
	CONFIG_DRM_BRIDGE=y \
	CONFIG_HDMI=y \
	CONFIG_PHY_ROCKCHIP_INNO_HDMI \
	CONFIG_DRM_DW_HDMI \
	CONFIG_DRM_DW_HDMI_CEC \
	CONFIG_ROCKCHIP_VOP=y \
	CONFIG_ROCKCHIP_VOP2=y \
	CONFIG_ROCKCHIP_ANALOGIX_DP=n \
	CONFIG_ROCKCHIP_CDN_DP=n \
	CONFIG_ROCKCHIP_DW_HDMI=y \
	CONFIG_ROCKCHIP_INNO_HDMI=y \
	CONFIG_ROCKCHIP_DW_MIPI_DSI=y \
	CONFIG_ROCKCHIP_LVDS=y \
	CONFIG_ROCKCHIP_RGB=n \
	CONFIG_ROCKCHIP_RK3066_HDMI=n \
	CONFIG_DRM_DP_AUX_BUS \
	CONFIG_DRM_DW_HDMI_GP_AUDIO=n \
	CONFIG_DRM_PANEL=y \
	CONFIG_DRM_PANEL_BRIDGE=y \
	CONFIG_DRM_PANEL_SIMPLE \
	CONFIG_MEDIA_CEC_RC=y \
	CONFIG_DRM_ANALOGIX_ANX7625=n@ge6.2 \
	CONFIG_DRM_CHIPONE_ICN6211=n@ge6.2 \
	CONFIG_DRM_ITE_IT6505=n@ge6.2 \
	CONFIG_DRM_ITE_IT66121=n@ge6.2 \
	CONFIG_DRM_LONTIUM_LT8912B=n@ge6.2 \
	CONFIG_DRM_LONTIUM_LT9211=n@ge6.2 \
	CONFIG_DRM_LONTIUM_LT9611UXC=n@ge6.2 \
	CONFIG_DRM_PANEL_ABT_Y030XX067A=n@ge6.2 \
	CONFIG_DRM_PANEL_BOE_BF060Y8M_AJ0=n@ge6.2 \
	CONFIG_DRM_PANEL_DSI_CM=n@ge6.2 \
	CONFIG_DRM_PANEL_EDP=n@ge6.2 \
	CONFIG_DRM_PANEL_ILITEK_ILI9341=n@ge6.2 \
	CONFIG_DRM_PANEL_INNOLUX_EJ030NA=n@ge6.2 \
	CONFIG_DRM_PANEL_JDI_R63452=n@ge6.2 \
	CONFIG_DRM_PANEL_KHADAS_TS050=n@ge6.2 \
	CONFIG_DRM_PANEL_MIPI_DBI=n@ge6.2 \
	CONFIG_DRM_PANEL_NEWVISION_NV3052C=n@ge6.2 \
	CONFIG_DRM_PANEL_NOVATEK_NT35560=n@ge6.2 \
	CONFIG_DRM_PANEL_NOVATEK_NT35950=n@ge6.2 \
	CONFIG_DRM_PANEL_NOVATEK_NT36672A=n@ge6.2 \
	CONFIG_DRM_PANEL_SAMSUNG_ATNA33XC20=n@ge6.2 \
	CONFIG_DRM_PANEL_SAMSUNG_DB7430=n@ge6.2 \
	CONFIG_DRM_PANEL_SAMSUNG_S6D27A1=n@ge6.2 \
	CONFIG_DRM_PANEL_SAMSUNG_SOFEF00=n@ge6.2 \
	CONFIG_DRM_PANEL_SHARP_LS060T1SX01=n@ge6.2 \
	CONFIG_DRM_PANEL_SONY_TULIP_TRULY_NT35521=n@ge6.2 \
	CONFIG_DRM_PANEL_TDO_TL070WSH30=n@ge6.2 \
	CONFIG_DRM_PANEL_WIDECHIPS_WS2401=n@ge6.2 \
	CONFIG_DRM_RCAR_USE_LVDS=n@ge6.2 \
	CONFIG_DRM_SIMPLEDRM=n@ge6.2 \
	CONFIG_DRM_SSD130X=n@ge6.2 \
	CONFIG_DRM_TI_SN65DSI83=n@ge6.2 \
	CONFIG_TINYDRM_ILI9163=n@ge6.2
  FILES:= \
	$(LINUX_DIR)/drivers/gpu/drm/bridge/synopsys/dw-hdmi.ko \
	$(LINUX_DIR)/drivers/gpu/drm/bridge/synopsys/dw-hdmi-cec.ko \
	$(LINUX_DIR)/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.ko \
	$(LINUX_DIR)/drivers/media/cec/core/cec.ko \
	$(LINUX_DIR)/drivers/phy/rockchip/phy-rockchip-inno-hdmi.ko \
	$(LINUX_DIR)/drivers/gpu/drm/display/drm_dp_aux_bus.ko@le5.15 \
	$(LINUX_DIR)/drivers/gpu/drm/drm_dma_helper.ko \
	$(LINUX_DIR)/drivers/gpu/drm/display/drm_display_helper.ko \
	$(LINUX_DIR)/drivers/gpu/drm/panel/panel-simple.ko \
	$(LINUX_DIR)/drivers/gpu/drm/rockchip/rockchipdrm.ko
  AUTOLOAD:=$(call AutoProbe,rockchipdrm phy-rockchip-inno-hdmi dw-hdmi-cec)
endef

define KernelPackage/drm-rockchip/description
  Direct Rendering Manager (DRM) support for Rockchip
endef

$(eval $(call KernelPackage,drm-rockchip))

define KernelPackage/saradc-rockchip
  SUBMENU:=$(IIO_MENU)
  TITLE:=Rockchip SARADC support
  DEPENDS:=@TARGET_rockchip +kmod-industrialio-triggered-buffer
  KCONFIG:= \
	CONFIG_RESET_CONTROLLER=y \
	CONFIG_ROCKCHIP_SARADC \
	CONFIG_IIO_SCMI=n
  FILES:= \
	$(LINUX_DIR)/drivers/iio/adc/rockchip_saradc.ko
  AUTOLOAD:=$(call AutoProbe,rockchip_saradc)
endef

define KernelPackage/saradc-rockchip/description
  Support for the SARADC found in SoCs from Rockchip
endef

$(eval $(call KernelPackage,saradc-rockchip))
