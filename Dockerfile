FROM maven:3.8.6-openjdk-18
RUN apt-get update
RUN apt-get install git -y
WORKDIR /home/app
RUN git clone https://github.com/boxfuse/boxfuse-sample-java-war-hello.git /home/app
RUN mvn package
RUN find /home/app/target -name "*.war" -exec cp -t /opt/bitnami/scripts/tomcat/webapps {} +