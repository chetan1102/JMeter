FROM ubuntu:20.04
#FROM node:current-slim

ARG JMETER_VERSION="5.2.1"
ENV JMETER_HOME /opt/apache-jmeter-${JMETER_VERSION}
ENV JMETER_BIN  /opt/apache-jmeter-${JMETER_VERSION}/bin
ENV JMETER_DOWNLOAD_URL  https://archive.apache.org/dist/jmeter/binaries/apache-jmeter-${JMETER_VERSION}.tgz
ENV JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64/

WORKDIR /opt/apache-jmeter-${JMETER_VERSION}

ARG TZ="New Zealand"
RUN apt-get update -y
RUN apt-get install openjdk-11-jre openjdk-11-jdk -y
RUN apt-get install wget -y
RUN wget -nv https://apache.inspire.net.nz/jmeter/binaries/apache-jmeter-${JMETER_VERSION}.tgz
RUN tar -xzf apache-jmeter-${JMETER_VERSION}.tgz 
RUN mv apache-jmeter-${JMETER_VERSION}/* /opt/apache-jmeter-${JMETER_VERSION}
RUN rm -r /opt/apache-jmeter-${JMETER_VERSION}/apache-jmeter-${JMETER_VERSION}.tgz
RUN mkdir -p performancetesting/script performancetesting/script/data performancetesting/results

WORKDIR /opt/apache-jmeter-${JMETER_VERSION}/performancetesting
