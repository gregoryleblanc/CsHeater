#!../../bin/linux-arm/CsHeater

#- You may have to change CsHeater to something else
#- everywhere it appears in this file

< envPaths

cd "${TOP}"

## Register all support components
dbLoadDatabase "dbd/CsHeater.dbd"
CsHeater_registerRecordDeviceDriver pdbbase

## Load record instances
#dbLoadRecords("db/xxx.db","user=pi")

cd "${TOP}/iocBoot/${IOC}"
iocInit

## Start any sequence programs
#seq sncxxx,"user=pi"

#====================================================================
# modbus support

#drvModbusAsynConfigure(portName, tcpPortName, slaveAddress, modbusFuction, modbusStartAddress, modbusLength, dataType,
#                       pollMsec, plcType)
##  modbusFunction,  these are 16 bit registers.  Use 4 for read-only registers, 3 for r/w registers or 6 for write
##  registers.
##  modbusStartAddress = Use the realtive address in place of the full absolute address.
##  modbusLength,  see spreadsheet for the various menus.  May require multiple configuration definintions per menu
##  due to the limitation of the length definitions.
##  dataType,  there are multiple data types within a menu so it's presumed these will need to be segregated which
##  will expand the number of configurations.
##             testing different options to deteremine what will work most efficiently.

### set up the TCP/IP comms for modbus
drvAsynIPPortConfigure("watlow1", "10.0.0.196", 0, 0, 0)
##  https://epics-modbus.readthedocs.io/en/latest/#tcp-ip
##  drvAsynIPPortConfigure("portName","hostInfo",priority,noAutoConnect,noProcessEos)

### Add the link-specific bits for ModbusTCP
modbusInterposeConfig("watlow1", 0, 2000, 0)
##  https://epics-modbus.readthedocs.io/en/latest/#modbusinterposeconfig
##  modbusInterposeConfig(portName,linkType,timeoutMsec,writeDelayMsec)

### create the modbus port driver
### 16 == modbus write multiple registers
drvModbusAsynConfigure("watlow.w.1", "watlow1", 0, 16, -1, 4, 0, 2000, "watlow1");
##  https://epics-modbus.readthedocs.io/en/latest/#drvmodbusasynconfigure
##  drvModbusAsynConfigure(portName,tcpPortName,slaveAddress,modbusFunction,modbusStartAddress,modbusLength,
##                         dataType,pollMsec,plcType);

### create the modbus port driver
### 6 == modbus write single register
drvModbusAsynConfigure("watlow.enum.w.1", "watlow1", 0, 6, -1, 2, 0, 2000, "watlow1");




##  These configs are to be used for read or input records

##  Port Naming Convention:  Watlow_MD_DT_AI.I   where
##                              MD = Menu Description
##                                  AI == Analog Input
##                                  AO == Analog Output
##                                  Al == Alarm
##                                  Glb == FIXME
##                                  Lim == FIXME
##                                  Lin == FIXME
##                                  CL == FIXME
##                                  AO2 == FIXME
##                                  AO3 == FIXME
##                                  Prc == FIXME
##                              DT = Data Type
##                                  Num == Number (float? int? double?)
##                                  Enum == I think from here:
##                                          https://github.com/epicsdeb/modbus/blob/61e61608e758c457b3619c0c71523f8b12f1b11c/modbusApp/src/drvModbusAsyn.c#L75
##                              AI = Address Index (for the purpose when the range of addresses is greater the maximum
##                                   allowable.  Using blocks of 100 to make indexing simpler)
##								 I = Module Index

###  4 == modbus read input registers (16-bit registers)
drvModbusAsynConfigure("watlow_Glb_Num_1.1",  "watlow1", 0, 4,    0, 16, INT32_BE, 2000, "watlow1");
drvModbusAsynConfigure("watlow_Glb_Enum_1.1", "watlow1", 0, 4, 2308,  4, INT32_LE_BS, 2000, "watlow1");

drvModbusAsynConfigure("watlow_AI_Num_1.1",   "watlow1", 0, 4,  360, 62, INT32_BE, 2000, "watlow1");
drvModbusAsynConfigure("watlow_AI_Num_2.1",   "watlow1", 0, 4,  450, 62, INT32_BE, 2000, "watlow1");
drvModbusAsynConfigure("watlow_AI_Enum_1.1",  "watlow1", 0, 4,  362, 82, INT32_LE_BS, 2000, "watlow1");
drvModbusAsynConfigure("watlow_AI_Enum_2.1",  "watlow1", 0, 4,  452, 82, INT32_LE_BS, 2000, "watlow1");

drvModbusAsynConfigure("watlow_Al_Num_1.1",   "watlow1", 0, 4, 1880, 46, INT32_BE, 2000, "watlow1");
drvModbusAsynConfigure("watlow_Al_Enum_1.1",  "watlow1", 0, 4, 1886, 42, INT32_LE_BS, 2000, "watlow1");
drvModbusAsynConfigure("watlow_Al_Num_2.1",   "watlow1", 0, 4, 1940, 46, INT32_BE, 2000, "watlow1");
drvModbusAsynConfigure("watlow_Al_Enum_2.1",  "watlow1", 0, 4, 1946, 68, INT32_LE_BS, 2000, "watlow1");
drvModbusAsynConfigure("watlow_Al_Num_3.1",   "watlow1", 0, 4, 2000, 46, INT32_BE, 2000, "watlow1");
drvModbusAsynConfigure("watlow_Al_Enum_3.1",  "watlow1", 0, 4, 2006, 42, INT32_LE_BS, 2000, "watlow1");
drvModbusAsynConfigure("watlow_Al_Num_4.1",   "watlow1", 0, 4, 2060, 46, INT32_BE, 2000, "watlow1");
drvModbusAsynConfigure("watlow_Al_Enum_4.1",  "watlow1", 0, 4, 2066, 68, INT32_LE_BS, 2000, "watlow1");

drvModbusAsynConfigure("watlow_Lim_Num_1.1",  "watlow1", 0, 4,  720, 20, INT32_BE, 2000, "watlow1");
drvModbusAsynConfigure("watlow_Lim_Enum_1.1", "watlow1", 0, 4,  728, 24, INT32_LE_BS, 2000, "watlow1");

drvModbusAsynConfigure("watlow_Lin_Num_1.1",  "watlow1", 0, 4, 3562, 52, INT32_BE, 2000, "watlow1");
drvModbusAsynConfigure("watlow_Lin_Enum_1.1", "watlow1", 0, 4, 3568, 52, INT32_LE_BS, 2000, "watlow1");
drvModbusAsynConfigure("watlow_Lin_Num_2.1",  "watlow1", 0, 4, 3632, 52, INT32_BE, 2000, "watlow1");
drvModbusAsynConfigure("watlow_Lin_Enum_2.1", "watlow1", 0, 4, 3638, 52, INT32_LE_BS, 2000, "watlow1");

drvModbusAsynConfigure("watlow_CL_Num_1.1",   "watlow1", 0, 4, 2370, 46, INT32_BE, 2000, "watlow1");
drvModbusAsynConfigure("watlow_CL_Enum_1.1",  "watlow1", 0, 4, 2360, 54, INT32_LE_BS, 2000, "watlow1");
drvModbusAsynConfigure("watlow_CL_Num_2.1",   "watlow1", 0, 4, 2640, 50, INT32_BE, 2000, "watlow1");
drvModbusAsynConfigure("watlow_CL_Enum_2.1",  "watlow1", 0, 4, 2662, 22, INT32_LE_BS, 2000, "watlow1");

drvModbusAsynConfigure("watlow_AO_Num_1.1",   "watlow1", 0, 4,  852, 24, INT32_BE, 2000, "watlow1");
drvModbusAsynConfigure("watlow_AO_Enum_1.1",  "watlow1", 0, 4,  840,  8, INT32_LE_BS, 2000, "watlow1");

drvModbusAsynConfigure("watlow_AO2_Num_1.1",  "watlow1", 0, 4, 1034, 16, INT32_BE, 2000, "watlow1");
drvModbusAsynConfigure("watlow_AO2_Enum_1.1", "watlow1", 0, 4, 1038,  6, INT32_LE_BS, 2000, "watlow1");

drvModbusAsynConfigure("watlow_AO3_Num_1.1",  "watlow1", 0, 4, 1064, 16, INT32_BE, 2000, "watlow1");
drvModbusAsynConfigure("watlow_AO3_Enum_1.1", "watlow1", 0, 4, 1068,  6, INT32_LE_BS, 2000, "watlow1");

drvModbusAsynConfigure("watlow_Prc_Num_1.1",  "watlow1", 0, 4, 3310, 14, INT32_BE, 2000, "watlow1");
drvModbusAsynConfigure("watlow_Prc_Enum_1.1", "watlow1", 0, 4, 3320, 20, INT32_LE_BS, 2000, "watlow1");
#====================================================================





