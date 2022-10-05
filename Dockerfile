FROM ubuntu:20.04

#setting time zone
ENV TZ=Europe/Moscow
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

#update and app install
RUN apt-get -y update && apt-get install -y \
git \
maven

#setting directory and packaging
WORKDIR /home/app
RUN git clone https://github.com/boxfuse/boxfuse-sample-java-war-hello.git /home/app
RUN mvn package

#moving war file
WORKDIR /usr/local/tomcat/webapps
RUN find /home/app/target -name "*.war" -exec cp -t /usr/local/tomcat/webapps {} +
