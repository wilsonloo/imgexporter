LUAINCLUDE=-I/home/wilson/buildstation/lua-5.3.6_Linux54_64_lib/include

all: 3rd/bson/bson.so

3rd/bson/bson.so: 3rd/bson/Makefile
	cd 3rd/bson && make LUAINCLUDE=$(LUAINCLUDE) linux

3rd/bson/Makefile:
	git submodule update --init 3rd/bson

