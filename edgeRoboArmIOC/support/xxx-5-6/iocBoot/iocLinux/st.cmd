# Linux startup script

< envPaths

epicsEnvSet("PREFIX", "xxx:")

################################################################################
# Tell EPICS all about the record types, device-support modules, drivers,
# etc. in the software we just loaded (xxx.munch)
dbLoadDatabase("../../dbd/iocxxxLinux.dbd")
iocxxxLinux_registerRecordDeviceDriver(pdbbase)

### save_restore setup
# We presume a suitable initHook routine was compiled into xxx.munch.
# See also create_monitor_set(), after iocInit() .
< save_restore.cmd

drvAsynUSBPortConfigure("USB1", "Robotic Arm", 0x1267, 0, 0, 0, 0, 1)
asynOctetConnect("USB1", "USB1")

usbCreateDriver("JOYSTICK", "$(USB)/usbApp/Db/LogitechExtreme3DPro.in")
usbConnectDevice("JOYSTICK", 0, 0x046D, 0xC215)

dbLoadRecords("../../xxxApp/Db/roboArm.db", "P=xxx:, A=A1:, INPORT=JOYSTICK, OUTPORT=USB1")
###############################################################################
###############################################################################
###############################################################################
iocInit
###############################################################################
###############################################################################
###############################################################################

dbl > dbl-all.txt

### startup State Notation Language programs

### Start up the autosave task and tell it what to do.
create_monitor_set("auto_settings.req",30,"P=$(PREFIX)")
