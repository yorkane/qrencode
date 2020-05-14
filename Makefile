LIBNAME= qrencode
CFLAGS= -std=gnu99 -pedantic -Wall -Wextra -O2 -shared -fPIC -I/usr/local/openresty/luajit/include/luajit-2.1/ -Wl,-rpath,/usr/local/openresty/site/lualib/

all: so

so:	$(LIBNAME).c
	$(CC) $(CFLAGS) $(LIBNAME).c  -lqrencode -lpng -o $(LIBNAME).so

clean:
	rm -f $(LIBNAME).so 

install:
	mv -f qrencode.so /opt/data/openresty/site/lualib/

#
#curl -Lk https://fukuchi.org/works/qrencode/qrencode-4.0.2.tar.gz | tar xvz
#cd qrencode-4.0.2
#./configure
#make
#mv .libs/libqrencode.so.4.0.2 /usr/local/openresty/site/lualib/libqrencode.so.4
