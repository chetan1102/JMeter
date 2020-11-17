WORKDIR /opt/apache-jmeter-5.2.1

RUN yum update -y
RUN yum install java-1.8.0-openjdk java-1.8.0-openjdk-devel -y
RUN yum install wget -y
RUN wget http://apache.stu.edu.tw//jmeter/binaries/apache-jmeter-5.2.1.tgz
RUN tar -xzf apache-jmeter-5.2.1.tgz 
RUN mv apache-jmeter-5.2.1/* /opt/apache-jmeter-5.2.1
RUN rm -r /opt/apache-jmeter-5.2.1/apache-jmeter-5.2.1

RUN mkdir script/

Copy /home/cchauhan/git/JMeter/*.jmx script/
