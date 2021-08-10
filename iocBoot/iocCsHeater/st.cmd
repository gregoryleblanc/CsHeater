#====================================================================
# modbus support

#drvModbusAsynConfigure(portName, tcpPortName, slaveAddress, modbusFuction, modbusStartAddress, modbusLength, dataType, pollMsec, plcType)
##  modbusFunction,  these are 16 bit registers.  Use 4 for read-only registers, 3 for r/w registers or 6 for write registers.
##  modbusStartAddress = Use the realtive address in place of the full absolute address.
##  modbusLength,  see spreadsheet for the various menus.  May require multiple configuration definintions per menu due to the limitation of the length definitions.
##  dataType,  there are multiple data types within a menu so it's presumed these will need to be segregated which will expand the number of configurations.
##             testing different options to deteremine what will work most efficiently.

drvAsynIPPortConfigure("watlow1", "10.0.0.196", 0, 0, 0)
modbusInterposeConfig("watlow1", 0, 2000, 0)
drvModbusAsynConfigure("watlow.w.1", "watlow1", 0, 16, -1, 4, 0, 2000, "watlow1");
drvModbusAsynConfigure("watlow.enum.w.1", "watlow1", 0, 6, -1, 2, 0, 2000, "watlow1");

##  These configs are to be used for read or input records

##  Port Naming Convention:  Watlow_MD_DT_AI.I   where
##                              MD = Menu Description
##                              DT = Data Type
##                              AI = Address Index (for the purpose when the range of addresses is greater the maximum allowable.  Using blocks of 100 to make indexing simpler)
##								 I = Module Index

drvModbusAsynConfigure("watlow_Glb_Num_1.1",  "watlow1", 0, 4,    0, 16, 7, 2000, "watlow1");
drvModbusAsynConfigure("watlow_Glb_Enum_1.1", "watlow1", 0, 4, 2308,  4, 6, 2000, "watlow1");

drvModbusAsynConfigure("watlow_AI_Num_1.1",   "watlow1", 0, 4,  360, 62, 7, 2000, "watlow1");
drvModbusAsynConfigure("watlow_AI_Num_2.1",   "watlow1", 0, 4,  450, 62, 7, 2000, "watlow1");
drvModbusAsynConfigure("watlow_AI_Enum_1.1",  "watlow1", 0, 4,  362, 82, 6, 2000, "watlow1");
drvModbusAsynConfigure("watlow_AI_Enum_2.1",  "watlow1", 0, 4,  452, 82, 6, 2000, "watlow1");

drvModbusAsynConfigure("watlow_Al_Num_1.1",   "watlow1", 0, 4, 1880, 46, 7, 2000, "watlow1");
drvModbusAsynConfigure("watlow_Al_Enum_1.1",  "watlow1", 0, 4, 1886, 42, 6, 2000, "watlow1");
drvModbusAsynConfigure("watlow_Al_Num_2.1",   "watlow1", 0, 4, 1940, 46, 7, 2000, "watlow1");
drvModbusAsynConfigure("watlow_Al_Enum_2.1",  "watlow1", 0, 4, 1946, 68, 6, 2000, "watlow1");
drvModbusAsynConfigure("watlow_Al_Num_3.1",   "watlow1", 0, 4, 2000, 46, 7, 2000, "watlow1");
drvModbusAsynConfigure("watlow_Al_Enum_3.1",  "watlow1", 0, 4, 2006, 42, 6, 2000, "watlow1");
drvModbusAsynConfigure("watlow_Al_Num_4.1",   "watlow1", 0, 4, 2060, 46, 7, 2000, "watlow1");
drvModbusAsynConfigure("watlow_Al_Enum_4.1",  "watlow1", 0, 4, 2066, 68, 6, 2000, "watlow1");

drvModbusAsynConfigure("watlow_Lim_Num_1.1",  "watlow1", 0, 4,  720, 20, 7, 2000, "watlow1");
drvModbusAsynConfigure("watlow_Lim_Enum_1.1", "watlow1", 0, 4,  728, 24, 6, 2000, "watlow1");

drvModbusAsynConfigure("watlow_Lin_Num_1.1",  "watlow1", 0, 4, 3562, 52, 7, 2000, "watlow1");
drvModbusAsynConfigure("watlow_Lin_Enum_1.1", "watlow1", 0, 4, 3568, 52, 6, 2000, "watlow1");
drvModbusAsynConfigure("watlow_Lin_Num_2.1",  "watlow1", 0, 4, 3632, 52, 7, 2000, "watlow1");
drvModbusAsynConfigure("watlow_Lin_Enum_2.1", "watlow1", 0, 4, 3638, 52, 6, 2000, "watlow1");

drvModbusAsynConfigure("watlow_CL_Num_1.1",   "watlow1", 0, 4, 2370, 46, 7, 2000, "watlow1");
drvModbusAsynConfigure("watlow_CL_Enum_1.1",  "watlow1", 0, 4, 2360, 54, 6, 2000, "watlow1");
drvModbusAsynConfigure("watlow_CL_Num_2.1",   "watlow1", 0, 4, 2640, 50, 7, 2000, "watlow1");
drvModbusAsynConfigure("watlow_CL_Enum_2.1",  "watlow1", 0, 4, 2662, 22, 6, 2000, "watlow1");

drvModbusAsynConfigure("watlow_AO_Num_1.1",   "watlow1", 0, 4,  852, 24, 7, 2000, "watlow1");
drvModbusAsynConfigure("watlow_AO_Enum_1.1",  "watlow1", 0, 4,  840,  8, 6, 2000, "watlow1");

drvModbusAsynConfigure("watlow_AO2_Num_1.1",  "watlow1", 0, 4, 1034, 16, 7, 2000, "watlow1");
drvModbusAsynConfigure("watlow_AO2_Enum_1.1", "watlow1", 0, 4, 1038,  6, 6, 2000, "watlow1");

drvModbusAsynConfigure("watlow_AO3_Num_1.1",  "watlow1", 0, 4, 1064, 16, 7, 2000, "watlow1");
drvModbusAsynConfigure("watlow_AO3_Enum_1.1", "watlow1", 0, 4, 1068,  6, 6, 2000, "watlow1");

drvModbusAsynConfigure("watlow_Prc_Num_1.1",  "watlow1", 0, 4, 3310, 14, 7, 2000, "watlow1");
drvModbusAsynConfigure("watlow_Prc_Enum_1.1", "watlow1", 0, 4, 3320, 20, 6, 2000, "watlow1");
#====================================================================





