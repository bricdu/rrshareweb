# 自构建群晖用人人影视 docker版本
使用官方客户端构建
docker build -t iduxx/rrshareweb .
docker run -d -p 80:3001 -v /yourdir/data:/opt/work/rrshareweb/data  iduxx/rrshareweb
