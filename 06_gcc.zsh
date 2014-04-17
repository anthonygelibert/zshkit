CFLAGS_DEFAUT="-std=gnu99 -pipe -fstack-protector -Wl,-z,relro -Wl,-z,now -Wformat-security -fvisibility=hidden -Wpointer-arith -Wformat-nonliteral -Winit-self -Wall -Wextra -Werror -Wl,-O1 -Wl,--discard-all -Wl,--no-undefined -Wl,--build-id=sha1 -rdynamic"
CFLAGS_FOR_DEBUG="-Og -ggdb3"
CFLAGS_FOR_PROD="-O3 -g0"
