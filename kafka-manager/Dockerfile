FROM giabar/gb-sbt
ADD https://github.com/yahoo/kafka-manager/archive/master.zip /
RUN unzip master.zip &&\
rm -f master.zip &&\
mv kafka-manager-master kafkamanager
WORKDIR /kafkamanager
RUN ls && sbt clean dist

FROM openjdk:8-jdk-alpine
COPY --from=0 /kafkamanager/target/universal/kafka-manager*.zip .
#RUN apk add bash &&\
#unzip kafka-manager*.zip &&\
#mv kafka-manager-1.3.3.18 kafka-manager &&\
#rm -f kafka-manager-1.3.3.18.zip &&\
#mv kafka-manager /
#CMD ["/kafka-manager/bin/kafka-manager"]