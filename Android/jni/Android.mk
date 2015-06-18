LOCAL_PATH:= $(call my-dir)
HEIMDALL_REL_ROOT := ../..
HEIMDALL_ABS_PATH := $(LOCAL_PATH)/../..

include $(CLEAR_VARS)
####### libpit #######
LOCAL_SRC_FILES := $(HEIMDALL_REL_ROOT)/libpit/source/libpit.cpp

LOCAL_C_INCLUDES := $(HEIMDALL_REL_ROOT)/libpit/source

LOCAL_MODULE := libpit
include $(BUILD_STATIC_LIBRARY)

##### heimdall #######
include $(CLEAR_VARS)
LOCAL_SRC_FILES += \
$(HEIMDALL_REL_ROOT)/heimdall/source/Arguments.cpp \
$(HEIMDALL_REL_ROOT)/heimdall/source/BridgeManager.cpp \
$(HEIMDALL_REL_ROOT)/heimdall/source/ClosePcScreenAction.cpp \
$(HEIMDALL_REL_ROOT)/heimdall/source/DetectAction.cpp \
$(HEIMDALL_REL_ROOT)/heimdall/source/DownloadPitAction.cpp \
$(HEIMDALL_REL_ROOT)/heimdall/source/FlashAction.cpp \
$(HEIMDALL_REL_ROOT)/heimdall/source/HelpAction.cpp \
$(HEIMDALL_REL_ROOT)/heimdall/source/InfoAction.cpp \
$(HEIMDALL_REL_ROOT)/heimdall/source/Interface.cpp \
$(HEIMDALL_REL_ROOT)/heimdall/source/main.cpp \
$(HEIMDALL_REL_ROOT)/heimdall/source/PrintPitAction.cpp \
$(HEIMDALL_REL_ROOT)/heimdall/source/Utility.cpp \
$(HEIMDALL_REL_ROOT)/heimdall/source/VersionAction.cpp \

LOCAL_CFLAGS += -DOS_LINUX -std=c++11

LOCAL_C_INCLUDES += \
	$(HEIMDALL_REL_ROOT)/heimdall/source \
	$(HEIMDALL_REL_ROOT)/libpit/source \
	$(LOCAL_PATH)/libusb-1.0.19 \

LOCAL_STATIC_LIBRARIES += libpit
LOCAL_SHARED_LIBRARIES += libusb1.0
LOCAL_MODULE := heimdall
include $(BUILD_EXECUTABLE)

#### libusb-1.0 #######
include $(LOCAL_PATH)/libusb-1.0.19/android/jni/libusb.mk
