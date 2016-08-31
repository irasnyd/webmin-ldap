FROM centos:7
MAINTAINER Ira W. Snyder <isnyder@lcogt.net>

ENV WEBMIN_VERSION 1.810
ENV WEBMIN_RELEASE 1
ENV TINI_VERSION v0.10.0

ENTRYPOINT [ "/init" ]
EXPOSE 10000

RUN yum -y install http://pilotfiber.dl.sourceforge.net/project/webadmin/webmin/${WEBMIN_VERSION}/webmin-${WEBMIN_VERSION}-${WEBMIN_RELEASE}.noarch.rpm \
        && yum -y install openldap-servers perl-LDAP \
        && yum -y update \
        && yum -y clean all

RUN curl -L https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini > /usr/bin/tini \
        && chmod +x /usr/bin/tini

COPY webmin-miniserv-user /usr/bin/
COPY init /
