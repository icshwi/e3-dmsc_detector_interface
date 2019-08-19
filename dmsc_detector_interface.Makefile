#
#  Copyright (c) 2018 - Present  European Spallation Source ERIC
#
#  The program is free software: you can redistribute
#  it and/or modify it under the terms of the GNU General Public License
#  as published by the Free Software Foundation, either version 2 of the
#  License, or any newer version.
#
#  This program is distributed in the hope that it will be useful, but WITHOUT
#  ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
#  FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
#  more details.
#
#  You should have received a copy of the GNU General Public License along with
#  this program. If not, see https://www.gnu.org/licenses/gpl-2.0.txt
#
# 
# Author  : waynelewis
# email   : waynelewis@esss.se
# Date    : generated by 2018Dec03-2313-06CET
# version : 0.0.0 
#
# template file is generated by e3-tools/e3TemplateGenerator/e3TemplateGenerator.bash with 
# Please look at many other _module_.Makefile in e3-* repository
# 

## The following lines are mandatory, please don't change them.
where_am_I := $(dir $(abspath $(lastword $(MAKEFILE_LIST))))
include $(E3_REQUIRE_TOOLS)/driver.makefile
include $(E3_REQUIRE_CONFIG)/DECOUPLE_FLAGS



# If one would like to use the module dependency restrictly,
# one should look at other modules makefile to add more
# In most case, one should ignore the following lines:

#ifneq ($(strip $(ASYN_DEP_VERSION)),)
#asyn_VERSION=$(ASYN_DEP_VERSION)
#endif

#ifneq ($(strip $(SEQUENCER_DEP_VERSION)),)
#sequencer_VERSION=$(SEQUENCER_DEP_VERSION)
#endif



## Exclude linux-ppc64e6500
EXCLUDE_ARCHS = linux-ppc64e6500


APP:=dmsc_detector_interfaceApp
APPDB:=$(APP)/Db
APPPROTO:=$(APP)/protocol
APPSRC:=$(APP)/src
APPSCRIPT:=$(APP)/script


# USR_INCLUDES += -I$(where_am_I)$(APPSRC)

USR_CFLAGS   += -Wno-unused-variable
USR_CFLAGS   += -Wno-unused-function
USR_CFLAGS   += -Wno-unused-but-set-variable
USR_CPPFLAGS += -Wno-unused-variable
USR_CPPFLAGS += -Wno-unused-function
USR_CPPFLAGS += -Wno-unused-but-set-variable

TEMPLATES += $(wildcard $(APPDB)/*.db)
TEMPLATES += $(wildcard $(APPPROTO)/*.proto)

#DBDINC_SRCS += $(APPSRC)/getTimeStamp_aSub.c

#DBDINC_DBDS = $(subst .c,.dbd,   $(DBDINC_SRCS:$(APPSRC)/%=%))
# DBDINC_HDRS = $(subst .c,.h,     $(DBDINC_SRCS:$(APPSRC)/%=%))
# DBDINC_DEPS = $(subst .c,$(DEP), $(DBDINC_SRCS:$(APPSRC)/%=%))

#SOURCES += $(APPSRC)/*.c
SOURCES += $(APPSRC)/getTimeStamp_aSub.c
SOURCES += $(APPSRC)/syncState_aSub.c
SOURCES += $(APPSRC)/getRange_aSub.c
SOURCES += $(APPSRC)/convertIPAddress.cpp
SOURCES += $(APPSRC)/convertMACAddress.cpp
SOURCES += $(APPSRC)/generateHexString.c
SOURCES += $(APPSRC)/getBuildTime_aSub.c
# # DBDINC_SRCS should be last of the series of SOURCES
# SOURCES += $(DBDINC_SRCS)

DBDS += $(APPSRC)/detectorinterface.dbd
DBDS += $(APPSRC)/convertIPAddress.dbd
DBDS += $(APPSRC)/convertMACAddress.dbd
DBDS += $(APPSRC)/generateHexString.dbd

#
# $(DBDINC_DEPS): $(DBDINC_HDRS)
#
# .dbd.h:
# 	$(DBTORECORDTYPEH)  $(USR_DBDFLAGS) -o $@ $<
#
# .PHONY: $(DBDINC_DEPS) .dbd.h
#
#

SCRIPTS += $(wildcard ../iocsh/*.iocsh)
SCRIPTS += $(wildcard $(APPSCRIPT)/*)


## This RULE should be used in case of inflating DB files 
## db rule is the default in RULES_DB, so add the empty one
## Please look at e3-mrfioc2 for example.

db: 

.PHONY: db 

#
# USR_DBFLAGS += -I . -I ..
# USR_DBFLAGS += -I $(EPICS_BASE)/db
# USR_DBFLAGS += -I $(APPDB)
#
# SUBS=$(wildcard $(APPDB)/*.substitutions)
# TMPS=$(wildcard $(APPDB)/*.template)
#
# db: $(SUBS) $(TMPS)

# $(SUBS):
#	@printf "Inflating database ... %44s >>> %40s \n" "$@" "$(basename $(@)).db"
#	@rm -f  $(basename $(@)).db.d  $(basename $(@)).db
#	@$(MSI) -D $(USR_DBFLAGS) -o $(basename $(@)).db -S $@  > $(basename $(@)).db.d
#	@$(MSI)    $(USR_DBFLAGS) -o $(basename $(@)).db -S $@

# $(TMPS):
#	@printf "Inflating database ... %44s >>> %40s \n" "$@" "$(basename $(@)).db"
#	@rm -f  $(basename $(@)).db.d  $(basename $(@)).db
#	@$(MSI) -D $(USR_DBFLAGS) -o $(basename $(@)).db $@  > $(basename $(@)).db.d
#	@$(MSI)    $(USR_DBFLAGS) -o $(basename $(@)).db $@

#
# .PHONY: db $(SUBS) $(TMPS)

vlibs:

.PHONY: vlibs
