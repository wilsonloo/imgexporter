LUA_INCLUDE_DIR=/home/wilson/buildstation/lua-5.3.6_Linux54_64_lib/include
LUAINCLUDE=-I$(LUA_INCLUDE_DIR)

###############################
# bson.so
all: 3rd/bson/bson.so

3rd/bson/bson.so: 3rd/bson/Makefile
	cd 3rd/bson && make LUAINCLUDE=$(LUAINCLUDE) linux
3rd/bson/Makefile:
	git submodule update --init 3rd/bson

###############################
# cjson.so
all:3rd/cjson/cjson.so

3rd/cjson/cjson.so: 3rd/cjson/Makefile
	cd 3rd/cjson && make LUA_INCLUDE_DIR=$(LUA_INCLUDE_DIR)
3rd/cjson/Makefile:
	git submodule update --init 3rd/cjson
	
