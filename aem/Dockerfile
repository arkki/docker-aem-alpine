# Original sources: https://hub.docker.com/r/frolvlad/alpine-oraclejdk8/~/dockerfile/
FROM arkki/oraclejdk8:3.5-alpine
MAINTAINER arkki@arkki.tech

RUN apk --update --no-cache --virtual=build-dependencies add bash fish tzdata mdocml-apropos

COPY alpine-aem/startup.sh /opt/aem/startup.sh
RUN chmod +x /opt/aem/startup.sh

COPY aem-quickstart.jar /opt/aem/aem-quickstart.jar
COPY license.properties /opt/aem/license.properties

ENTRYPOINT ["/opt/aem/startup.sh"]