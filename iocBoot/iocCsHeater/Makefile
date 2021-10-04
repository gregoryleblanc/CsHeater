TOP = ../..
include $(TOP)/configure/CONFIG
ARCH = $(EPICS_HOST_ARCH)
TARGETS = envPaths st.cmd.brief
include $(TOP)/configure/RULES.ioc

st.cmd.brief: st.cmd
	@sed -e '/^\s*\(#[^!].*\|#$$\)/d' -e '/./!d' st.cmd > st.cmd.brief
	@chmod u+x st.cmd.brief
