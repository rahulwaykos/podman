## Dockefile for jboss-eap-platform 6.1  
## Jboss-eap-6.1 downloaded on host

FROM centos:centos7
RUN yum update -y  \
    &&  yum install epel-release -y \
    &&  yum install java-1.6.0-openjdk java-1.6.0-openjdk-devel -y

RUN useradd jboss

RUN mkdir -p /opt/jboss/

COPY jboss /opt/jboss/

WORKDIR /opt/jboss/

RUN chown -R jboss /opt/jboss/jboss-eap-6.1 

WORKDIR /opt/jboss/jboss-eap-6.1/bin/

RUN ./add-user.sh -u admin -p admin@123 --silent

EXPOSE 8080 9990 4447

ENTRYPOINT ["/opt/jboss/jboss-eap-6.1/bin/standalone.sh", "-b", "0.0.0.0"]
