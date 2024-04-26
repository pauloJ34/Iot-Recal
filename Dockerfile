FROM alpine:latest

RUN apk --no-cache -X http://dl-cdn.alpinelinux.org/alpine/edge/main add\
    ca-certificates  \
    openssl-dev \
    libpcap-dev\
    pcre\
    build-base\
    lua5.1-dev\
    lua5.1-libs\
    openresty\
    luarocks \
    && cd /usr/bin/ && mv luarocks-5.1 luarocks \
    && luarocks install lapis \
		&& luarocks install --local luabitop  \
		&& luarocks install --local lapis-annotate