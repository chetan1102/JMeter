FROM ubuntu:20.04

ARG JMETER_VERSION="5.2.1"
ENV JMETER_HOME /opt/apache-jmeter-5.2.1
ENV JMETER_BIN  /opt/apache-jmeter-5.2.1/bin
ENV JMETER_DOWNLOAD_URL  https://archive.apache.org/dist/jmeter/binaries/apache-jmeter-5.2.1.tgz
ENV JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64/

WORKDIR /opt/apache-jmeter-5.2.1

ARG TZ="New Zealand"
RUN apt-get update -y
RUN apt-get install openjdk-11-jre openjdk-11-jdk -y
RUN apt-get install wget -y
RUN wget https://apache.inspire.net.nz//jmeter/binaries/apache-jmeter-5.2.1.tgz
RUN tar -xzf apache-jmeter-5.2.1.tgz 
RUN mv apache-jmeter-5.2.1/* /opt/apache-jmeter-5.2.1
RUN rm -r /opt/apache-jmeter-5.2.1/apache-jmeter-5.2.1

RUN mkdir script/
COPY /home/cchauhan/git/JMeter/pmk b2c portal-click&collect.jmx script/
