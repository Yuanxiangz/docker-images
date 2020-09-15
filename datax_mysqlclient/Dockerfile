FROM python:2.7-alpine

RUN apk update && apk add openjdk8 
RUN wget http://datax-opensource.oss-cn-hangzhou.aliyuncs.com/datax.tar.gz
RUN tar -zxvf datax.tar.gz -C /usr/local/ && rm datax.tar.gz 
RUN apk add mysql-client
RUN apk add git
