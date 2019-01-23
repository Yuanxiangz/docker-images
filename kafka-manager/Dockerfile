FROM giabar/gb-sbt
ADD https://github.com/yahoo/kafka-manager/archive/master.zip /
RUN unzip master.zip &&\
rm -f master.zip &&\
mv kafka-manager-master kafkamanager
WORKDIR /kafkamanager
RUN sbt clean dist

FROM openjdk:8-jdk-alpine
COPY --from=0 /kafkamanager/target/universal/kafka-manager-*.zip .
RUN apk add bash &&\
unzip kafka-manager-*.zip &&\
rm -f kafka-manager-*.zip &&\
mv kafka-manager-* /kafka-manager /
CMD ["/kafka-manager/bin/kafka-manager"]
EXPOSE 9000