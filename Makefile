CFLAGS = -DCEU_DEBUG -Werror -Wall `pkg-config play gstreamer-audio-1.0 gstsynchronousclock --cflags` -Wno-unused-variable
LDFLAGS = `pkg-config play gstreamer-audio-1.0 gstsynchronousclock --libs` -lgstsynchronousclock

all:
	ceu --cpp-args "-I ." $(CEUFILE)
	gcc -g -Os main.c $(CFLAGS) $(LDFLAGS) -o $(basename $(CEUFILE)).out

clean:
	find . -name "*.out"  | xargs rm -f
	find . -name "_ceu_*" | xargs rm -f

.PHONY: all clean compile
