## Alpine-RTMP

使用🐋Docker Alpin镜像构建RTMP服务

## 1.下载镜像
~~~shell
docker pull 607qwq/alpine-rtmp
~~~
## 2.运行容器
~~~shell
docker run -d -p 80:80 -p 1935:1935 -v /hls:/hls -v /video:/video --name rtmp alpine-rtmp
~~~
本机`hls`跟`video`中可存放相应的音视频文件，`hls`目录中文件主要用**ffmpeg**来推流，`video`目录中的文件主要用来点播使用。

## 3.使用容器

~~~shell
docker exec -it rtmp sh
~~~

可以进入容器根据自己实际的需求对相应的配置文件进行修改

## 4.演示

**点播**

![](https://i.loli.net/2021/08/27/cMXezNnfgQY8qwK.png)

**live**

~~~shell
ffmpeg -re -i 23.mp4 -vcodec copy -acodec copy -f flv "rtmp://127.0.0.1:1935/live/test1"
~~~

![](https://i.loli.net/2021/08/27/mWnLFJODuxb9XSp.png)

**hls**

~~~shell
 ffmpeg -re -i  24.mp4 -vcodec copy -acodec copy -f flv "rtmp://127.0.0.1:1935/hls/test2"
~~~

![](https://i.loli.net/2021/08/27/kOj79NJedY4XSTM.png)

**stat界面**

![](https://i.loli.net/2021/08/27/o6wlp2YSDRXOP94.png)

