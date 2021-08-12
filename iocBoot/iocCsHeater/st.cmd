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
drvAsynIPPortConfigure("watlow1", "10.0.0.196:502", 0, 0, 0)
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
###  documentation for the PM6C1CA-GAAAAAA controller is at
###  https://www.watlow.com/-/media/documents/user-manuals/pmpmintegrated.ashx?la=en&hash=F571AEE5BEDB0B8AAB2DC6600BB0F28AD08754AE
###  Use "Map 2" from the manual for all items below

###
drvModbusAsynConfigure("watlow_Glb_Num_1.1",  "watlow1", 0, 4,    0, 16, INT32_BE, 2000, "watlow1");
drvModbusAsynConfigure("watlow_Glb_Enum_1.1", "watlow1", 0, 4, 2308,  4, INT32_LE_BS, 2000, "watlow1");

###  Address 360 is Analog Input 1, which the manual says is a read-only float  *Page 70
###  Address 450 is Analog Input 2, which the manual says is a read-only float  *Page 70
###  Address 362 is Analog Input 1 Alarm, which the manual says is read-only uint  *Page 70
###  Address 452 is Analog Input 2 Alarm, which the manual says is read-only uint  *Page 70
drvModbusAsynConfigure("watlow_AI_Num_1.1",   "watlow1", 0, 4,  360, 62, INT32_BE, 2000, "watlow1");
#drvModbusAsynConfigure("watlow_AI_Num_2.1",   "watlow1", 0, 4,  450, 62, INT32_BE, 2000, "watlow1");
drvModbusAsynConfigure("watlow_AI_Enum_1.1",  "watlow1", 0, 4,  362, 82, INT32_LE_BS, 2000, "watlow1");
#drvModbusAsynConfigure("watlow_AI_Enum_2.1",  "watlow1", 0, 4,  452, 82, INT32_LE_BS, 2000, "watlow1");

###  Address 1880 is High Set Point, which the manual says is Read, Write, EEPROM, User Set, float  *Page 82
###  Address 1886 is Alarm 1 sides, which the manual says is Read, Write, EEPROM, User Set, uint  *Page 82
###  Address 1940 is not in my manual.
###  Address 1946 is not in my manual.
###  Address 2000 is not in my manual.
###  Address 2006 is not in my manual.
###  Address 2060 is not in my manual.
###  Address 2066 is not in my manual.
drvModbusAsynConfigure("watlow_Al_Num_1.1",   "watlow1", 0, 4, 1880, 46, INT32_BE, 2000, "watlow1");
drvModbusAsynConfigure("watlow_Al_Enum_1.1",  "watlow1", 0, 4, 1886, 42, INT32_LE_BS, 2000, "watlow1");
#drvModbusAsynConfigure("watlow_Al_Num_2.1",   "watlow1", 0, 4, 1940, 46, INT32_BE, 2000, "watlow1");
#drvModbusAsynConfigure("watlow_Al_Enum_2.1",  "watlow1", 0, 4, 1946, 68, INT32_LE_BS, 2000, "watlow1");
#drvModbusAsynConfigure("watlow_Al_Num_3.1",   "watlow1", 0, 4, 2000, 46, INT32_BE, 2000, "watlow1");
#drvModbusAsynConfigure("watlow_Al_Enum_3.1",  "watlow1", 0, 4, 2006, 42, INT32_LE_BS, 2000, "watlow1");
#drvModbusAsynConfigure("watlow_Al_Num_4.1",   "watlow1", 0, 4, 2060, 46, INT32_BE, 2000, "watlow1");
#drvModbusAsynConfigure("watlow_Al_Enum_4.1",  "watlow1", 0, 4, 2066, 68, INT32_LE_BS, 2000, "watlow1");

###  Address 720 is Clear Limit, which the manual says is Write, uint  *Page 75
###  Address 728 is Limit Sides, which the manual says is Read, Write, EEPROM, User Set, uint  *Page 114
#drvModbusAsynConfigure("watlow_Lim_Num_1.1",  "watlow1", 0, 4,  720, 20, INT32_BE, 2000, "watlow1");
#drvModbusAsynConfigure("watlow_Lim_Enum_1.1", "watlow1", 0, 4,  728, 24, INT32_LE_BS, 2000, "watlow1");

###  Address 3562 is Linearization Source Function, which the manual says is Read, Write, EEPROM, Users Set, un-signed 8-bits  *Page 103
###  Address 3568 is Linearization, which the manual says is Read, Write, EEPROM, Users Set, uint  *Page 103
###  Address 3632 is Linearization Source Instance, which the manual says is Read, Write, EEPROM, Users Set, un-signed 8-bits  *Page 103
###  Address 3638 is Linearization, which the manual says is Read, Write, EEPROM, Users Set, uint  *Page 103
#drvModbusAsynConfigure("watlow_Lin_Num_1.1",  "watlow1", 0, 4, 3562, 52, INT32_BE, 2000, "watlow1");
#drvModbusAsynConfigure("watlow_Lin_Enum_1.1", "watlow1", 0, 4, 3568, 52, INT32_LE_BS, 2000, "watlow1");
#drvModbusAsynConfigure("watlow_Lin_Num_2.1",  "watlow1", 0, 4, 3632, 52, INT32_BE, 2000, "watlow1");
#drvModbusAsynConfigure("watlow_Lin_Enum_2.1", "watlow1", 0, 4, 3638, 52, INT32_LE_BS, 2000, "watlow1");

###  Address 2370 is Heat Proportional Band, which the manual says is Read, Write, EEPROM, Users Set, float  *Page 78
###  Address 2360 is Control Mode, which the manual says is Read, Write, EEPROM, Users Set, uint  *Page 77
###  Address 2640 is Set Point, which the manual says is Read, Write, EEPROM, Users Set, float  *Page 78
###  Address 2662 is Auto-to-Manual Power, which the manual says is Read, Write, EEPROM, Users Set, uint  *Page 121
#drvModbusAsynConfigure("watlow_CL_Num_1.1",   "watlow1", 0, 4, 2370, 46, INT32_BE, 2000, "watlow1");
#drvModbusAsynConfigure("watlow_CL_Enum_1.1",  "watlow1", 0, 4, 2360, 54, INT32_LE_BS, 2000, "watlow1");
drvModbusAsynConfigure("watlow_CL_Num_2.1",   "watlow1", 0, 4, 2640, 50, INT32_BE, 2000, "watlow1");
#drvModbusAsynConfigure("watlow_CL_Enum_2.1",  "watlow1", 0, 4, 2662, 22, INT32_LE_BS, 2000, "watlow1");

###  Address 852 is Calibration Offset, which the manual says is Read, Write, EEPROM, Users Set, float  *Page 128
###  Address 840 is Output Process Type, which the manual says is Read, Write, EEPROM, Users Set, uint  *Page 126
#drvModbusAsynConfigure("watlow_AO_Num_1.1",   "watlow1", 0, 4,  852, 24, INT32_BE, 2000, "watlow1");
drvModbusAsynConfigure("watlow_AO_Enum_1.1",  "watlow1", 0, 4,  840,  8, INT32_LE_BS, 2000, "watlow1");

###  Address 1034 is not in my manual.
###  Address 1038 is not in my manual.
#drvModbusAsynConfigure("watlow_AO2_Num_1.1",  "watlow1", 0, 4, 1034, 16, INT32_BE, 2000, "watlow1");
#drvModbusAsynConfigure("watlow_AO2_Enum_1.1", "watlow1", 0, 4, 1038,  6, INT32_LE_BS, 2000, "watlow1");

###  Address 1064 is not in my manual.
###  Address 1068 is not in my manual.
#drvModbusAsynConfigure("watlow_AO3_Num_1.1",  "watlow1", 0, 4, 1064, 16, INT32_BE, 2000, "watlow1");
#drvModbusAsynConfigure("watlow_AO3_Enum_1.1", "watlow1", 0, 4, 1068,  6, INT32_LE_BS, 2000, "watlow1");

###  Address 3310 is Source Value A, which the manual says is Read, float  *Page 73
###  Address 3320 is Process Value Function, which the manual says is Read, Write, EEPROM, Users Set, uint  *Page 107
drvModbusAsynConfigure("watlow_Prc_Num_1.1",  "watlow1", 0, 4, 3310, 14, INT32_BE, 2000, "watlow1");
drvModbusAsynConfigure("watlow_Prc_Enum_1.1", "watlow1", 0, 4, 3320, 20, INT32_LE_BS, 2000, "watlow1");
#====================================================================
