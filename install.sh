#/bin/sh

path=/opt/rtmp

function install(){
sed -i 's/dl-cdn.alpinelinux.org/mirrors.tuna.tsinghua.edu.cn/g' /etc/apk/repositories

apk update 

apk add pcre lame yasm ffmpeg gcc g++ make wget git libc-dev openssl-dev pcre-dev zlib-dev && rm -rf /var/cache/apk/*

mkdir -p $path && cd $path

wget  http://nginx.org/download/nginx-1.18.0.tar.gz


tar -zxvf nginx-1.18.0.tar.gz

rm -rf nginx-1.18.0.tar.gz

mv nginx-1.18.0 nginx


git clone https://gitee.com/mirrors/nginx-rtmp-module.git

cd nginx && ./configure --prefix=/usr/local/nginx   --add-module=../nginx-rtmp-module  --with-http_ssl_module

make && make install 

mkdir /hls /video

ln -s /usr/local/nginx/sbin/nginx /usr/sbin/
}

install

