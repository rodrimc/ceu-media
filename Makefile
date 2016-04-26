###############################################################################
# EDIT
###############################################################################

CEU_DIR ?= /tmp/ceu

###############################################################################
# DO NOT EDIT
###############################################################################

SDL_DIR ?= .
ARCH_DIR ?= $(SDL_DIR)/arch
include $(CEU_DIR)/Makefile

ifneq ($(MAKECMDGOALS),link)
ifeq ("$(wildcard $(SDL_DIR)/arch/up)","")
$(error run "make link")
endif
endif

link:
	rm -f arch/up
	ln -s `readlink -f $(CEU_DIR)/arch` $(SDL_DIR)/arch/up
