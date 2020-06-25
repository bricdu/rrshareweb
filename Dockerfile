FROM debian:jessie-slim
LABEL maintainer="iduxx"
ENV TZ=Asia/Shanghai


RUN set -ex && \
apt-get update && \
apt-get install -y --no-install-recommends wget tar ca-certificates && \
wget http://appdown.rrys.tv/rrshareweb_linux.tar.gz -O /root/rrshareweb_linux.tar.gz && \
tar -xzvf /root/rrshareweb_linux.tar.gz -C /root && rm /root/rrshareweb_linux.tar.gz && \
chown -R root:root /root/rrshareweb && chmod a+x /root/rrshareweb/rrshareweb && \
ln -snf /usr/share/zoneinfo/${TZ} /etc/localtime && \
echo ${TZ} > /etc/timezone

EXPOSE 3001 6714 30210

VOLUME ["/opt/work/rrshareweb/data"]

ENTRYPOINT [ "/root/rrshareweb/rrshareweb" ]