CC:=clang

all:
	${CC} -shared -o lib/btree.so -fPIC lib/btree.c
