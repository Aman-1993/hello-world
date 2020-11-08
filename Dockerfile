# Pull base image 
From tomcat:8-jre8 

# Maintainer 
MAINTAINER "amanpreet.1993.as@gmail.com"
COPY ./webapp.war /usr/local/tomcat/webapps

