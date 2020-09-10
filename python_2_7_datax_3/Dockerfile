FROM python:2.7.13
ADD http://datax-opensource.oss-cn-hangzhou.aliyuncs.com/datax.tar.gz /usr/local/
RUN tar -xzvf /usr/local/datax.tar.gz -C /usr/local/ \
    && rm -f /usr/local/datax.tar.gz
RUN echo "deb http://mirrors.ustc.edu.cn/debian stable main contrib non-free" > /etc/apt/sources.list.d/mysqlclient.list \
    && apt-get update \
    && apt-get remove -y binutils \
    && apt-get install -y mysql-client