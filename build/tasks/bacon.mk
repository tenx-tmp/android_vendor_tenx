# Copyright (C) 2017 Unlegacy-Android
# Copyright (C) 2017,2020 The LineageOS Project
# Copyright (C) 2018,2020 The PixelExperience Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

ifneq ($(BUILD_WITH_COLORS),0)
    include $(TOP_DIR)vendor/aosp/build/core/colors.mk
endif

CUSTOM_TARGET_PACKAGE := $(PRODUCT_OUT)/$(CUSTOM_VERSION).zip
SHA256 := prebuilts/build-tools/path/$(HOST_PREBUILT_TAG)/sha256sum
MD5 := prebuilts/build-tools/path/$(HOST_PREBUILT_TAG)/md5sum
TENX_TARGET_PACKAGE_FOLDER := $(PRODUCT_OUT)

.PHONY: bacon custom
bacon: $(INTERNAL_OTA_PACKAGE_TARGET)
	$(hide) mv $(INTERNAL_OTA_PACKAGE_TARGET) $(CUSTOM_TARGET_PACKAGE)
	$(hide) $(MD5) $(CUSTOM_TARGET_PACKAGE) | sed "s|$(PRODUCT_OUT)/||" > $(CUSTOM_TARGET_PACKAGE).md5sum
	@echo -e ${CL_BLU}"                                    "${CL_BLU}
	@echo -e ${CL_BLU}"                                    "${CL_BLU}
	@echo -e ${CL_BLU}"                                    "${CL_BLU}
	@echo -e ${CL_RED}"████████╗███████╗███╗   ██╗██╗  ██╗ "${CL_RED}
	@echo -e ${CL_RED}"╚══██╔══╝██╔════╝████╗  ██║╚██╗██╔╝ "${CL_RED}
	@echo -e ${CL_RED}"   ██║   █████╗  ██╔██╗ ██║ ╚███╔╝  "${CL_RED}
	@echo -e ${CL_RED}"   ██║   ██╔══╝  ██║╚██╗██║ ██╔██╗  "${CL_RED}
	@echo -e ${CL_RED}"   ██║   ███████╗██║ ╚████║██╔╝ ██╗ "${CL_RED}
	@echo -e ${CL_RED}"   ╚═╝   ╚══════╝╚═╝  ╚═══╝╚═╝  ╚═╝ "${CL_RED}
	@echo -e ${CL_RED}"                                    "${CL_RED}
	@echo -e ${CL_RED}"       TenX build is completed!     "${CL_RED}
	@echo -e ${CL_CYN}"=============================-Package Details-============================"${CL_RST}
	@echo -e ${CL_CYN}"File           : "${CL_MAG} $(TENX_TARGET_PACKAGE_FOLDER)${CL_RST}
	@echo -e ${CL_CYN}"ZipName        : "${CL_MAG} $(CUSTOM_VERSION).zip${CL_RST}
	@echo -e ${CL_CYN}"Build ID       : $(shell sha256sum $(CUSTOM_TARGET_PACKAGE) | awk '{print $$1}')"${CL_RST}
	@echo -e ${CL_CYN}"MD5            : "${CL_MAG}"$(shell cat $(CUSTOM_TARGET_PACKAGE).md5sum | awk '{print $$1}')"${CL_RST}
	@echo -e ${CL_CYN}"Size           : "${CL_MAG}"$(shell du -hs $(CUSTOM_TARGET_PACKAGE) | awk '{print $$1}')"${CL_RST}
	@echo -e ${CL_CYN}"Size(Bytes)    : "${CL_MAG}"$(shell wc -c $(CUSTOM_TARGET_PACKAGE) | awk '{print $$1}')"${CL_RST}
	@echo -e ${CL_CYN}"DateTime       : "${CL_MAG} $(TENX_BUILD_DATETIME)${CL_RST}
	@echo -e ${CL_CYN}"Build Type     : "${CL_MAG} $(CUSTOM_BUILD_TYPE)${CL_RST}
	@echo -e ${CL_CYN}"==========================================================================="${CL_RST}
	@echo -e ""

custom: bacon
