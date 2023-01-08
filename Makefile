all: 3rd/bson/bson.so

3rd/bson/bson.so: 3rd/bson/Makefile
	cd 3rd/bson && make linux

3rd/bson/Makefile:
	git submodule update --init 3rd/bson

