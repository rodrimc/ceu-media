CEU_DIR = modules/ceu

override CEU_ARGS := #-DCEU_MEDIA_DEBUG
override CC_ARGS += `pkg-config play lua5.3 --libs --cflags` -l pthread -g -O0

SRC_NAME= $(notdir $(SRC))
BIN = $(SRC_NAME:%.ceu=%)

BUILD_PATH = build


all:
	mkdir -p $(BUILD_PATH)
	ceu --pre --pre-args="-I$(CEU_DIR)/include  												\
						-I./include $(CEU_ARGS)" 																	\
	          --pre-input=$(SRC)                                  			\
	    --ceu --ceu-err-unused=pass --ceu-err-uninitialized=pass        \
					  --ceu-features-lua=true --ceu-features-thread=true   			\
					  --ceu-features-exception=true	--ceu-features-dynamic=true	\
						--ceu-features-pause=true --ceu-features-pool=true				\
	    --env --env-types=$(CEU_DIR)/env/types.h                        \
	          --env-threads=$(CEU_DIR)/env/threads.h                    \
	          --env-main=$(CEU_DIR)/env/main.c                          \
	          --env-output=/tmp/x.c                                     \
	    --cc --cc-args="$(CC_ARGS)" 																		\
	         --cc-output=build/$(BIN)
	$(BUILD_PATH)/$(BIN)

clean:
	rm -rf $(BUILD_PATH)
