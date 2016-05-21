###############################################################################
# EDIT
###############################################################################

CEU_DIR ?= $(error set absolute path to "<ceu>" repository)

###############################################################################
# DO NOT EDIT
###############################################################################

MEDIA_DIR ?= .
ARCH_DIR ?= $(MEDIA_DIR)/arch
include $(CEU_DIR)/Makefile

ifneq ($(MAKECMDGOALS),link)
ifeq ("$(wildcard $(MEDIA_DIR)/arch/up)","")
$(error run "make link")
endif
endif

link:
	rm -f arch/up
	ln -s `readlink -f $(CEU_DIR)/arch` $(MEDIA_DIR)/arch/up
