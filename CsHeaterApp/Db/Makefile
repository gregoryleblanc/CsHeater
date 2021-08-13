TOP=../..
include $(TOP)/configure/CONFIG
#----------------------------------------
#  ADD MACRO DEFINITIONS BELOW HERE

# Install databases, templates & substitutions like this
#DB += mytemplate.template
DB += Watlow_PM_Alarm.template
DB += Watlow_PM_General.template
DB += Watlow_PM_Limits.template
DB += Watlow_PM_Loop.template
DB += Watlow_PM_Monitor.template
DB += Watlow_PM_Output_1.template
DB += Watlow_PM_Output_2_and_3.template
DB += Watlow_PM.template
DB += Watlow_PM_IOC_Alarms.template
DB += Watlow_PM_Loop_PID.template
DB += pid_set_window.template
DB += Update_PID_Set.template

# Only process the templates below as required by the application.
#DB += Watlow_PM_Analog_Input.template
#DB += Watlow_PM_Linearization.template
#DB += Watlow_PM_Process_Value.template

DB += Watlow_PM_General.db


# If <anyname>.db template is not named <anyname>*.template add
# <anyname>_TEMPLATE = <templatename>

include $(TOP)/configure/RULES
#----------------------------------------
#  ADD EXTRA GNUMAKE RULES BELOW HERE

