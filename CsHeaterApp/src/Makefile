TOP=../..

include $(TOP)/configure/CONFIG
#----------------------------------------
#  ADD MACRO DEFINITIONS AFTER THIS LINE
#=============================

#=============================
# Build the IOC application

PROD_IOC = CsHeater
# CsHeater.dbd will be created and installed
DBD += CsHeater.dbd

# CsHeater.dbd will be made up from these files:
CsHeater_DBD += base.dbd

# Include dbd files from all support applications:
#CsHeater_DBD += xxx.dbd
CsHeater_DBD += asyn.dbd
CsHeater_DBD += drvAsynIPPort.dbd
CsHeater_DBD += modbusApp.dbd
CsHeater_DBD += modbusSupport.dbd

# Include stuff to make PVs work
CsHeater_DBD += PVAServerRegister.dbd
CsHeater_DBD += qsrv.dbd

# Add all the support libraries needed by this IOC
#CsHeater_LIBS += xxx
CsHeater_LIBS += asyn
CsHeater_LIBS += modbus

# add libraries for PVs
CsHeater_LIBS += qsrv
CsHeater_LIBS += $(EPICS_BASE_PVA_CORE_LIBS)

# CsHeater_registerRecordDeviceDriver.cpp derives from CsHeater.dbd
CsHeater_SRCS += CsHeater_registerRecordDeviceDriver.cpp

# Build the main IOC entry point on workstation OSs.
CsHeater_SRCS_DEFAULT += CsHeaterMain.cpp
CsHeater_SRCS_vxWorks += -nil-

# Add support from base/src/vxWorks if needed
#CsHeater_OBJS_vxWorks += $(EPICS_BASE_BIN)/vxComLibrary

# Finally link to the EPICS Base libraries
CsHeater_LIBS += $(EPICS_BASE_IOC_LIBS)

#===========================

include $(TOP)/configure/RULES
#----------------------------------------
#  ADD RULES AFTER THIS LINE

