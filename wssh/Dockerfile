FROM kingaric/centos:7
MAINTAINER aric liyuanjunmail@sian.com
ADD wsshd-1.0.tar /usr/local/
RUN curl -ssl https://raw.githubusercontent.com/king-aric/remote-scripts/master/wssh/centos_env.sh|sh && \ 
    ln -s /usr/local/wsshd/wsshd /usr/bin/

EXPOSE 5000
CMD wsshd
