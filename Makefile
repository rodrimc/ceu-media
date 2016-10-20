CEU_DIR    = /home/rcms/workspace/tmp/ceu
CEU_UV_DIR = /home/rcms/workspace/tmp/ceu-libuv

CFLAGS = `pkg-config play lua5.3 libuv --libs --cflags` -l pthread

all:
	ceu --pre --pre-args="-I$(CEU_DIR)/include -I$(CEU_UV_DIR)/include -I./include" \
	          --pre-input=$(SRC)                                  \
	    --ceu --ceu-err-unused=pass --ceu-err-uninitialized=pass            \
	    --env --env-types=$(CEU_DIR)/env/types.h                         \
	          --env-threads=$(CEU_DIR)/env/threads.h                     \
	          --env-main=$(CEU_DIR)/env/main.c                           \
	          --env-output=/tmp/x.c                                         \
	    --cc --cc-args="$(CFLAGS)" \
	         --cc-output=/tmp/ceu-media-sample
	/tmp/ceu-media-sample
