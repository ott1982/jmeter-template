FROM openjdk:11-jre-slim

# USER
RUN mkdir -p /home/default \
&& adduser --uid 1022 --home /home/default --disabled-login default

# JMETER
RUN mkdir -p /opt/jmeter /tmp/jmeter \
&& chown default /opt/jmeter /tmp/jmeter \
&& apt update -y \
&& apt install wget -y \
&& wget -P /tmp https://dlcdn.apache.org//jmeter/binaries/apache-jmeter-5.4.1.tgz \
&& tar xfvz /tmp/apache-jmeter-5.4.1.tgz -C /opt/jmeter/ \
&& chown -R default /opt/jmeter \
&& rm /tmp/apache-jmeter-5.4.1.tgz \
&& ln -s /opt/jmeter/apache-jmeter-5.4.1/bin/jmeter.sh /usr/bin/jmeter

# SETTINGS
USER default
WORKDIR /home/default
VOLUME /tmp/jmeter

# SOURCE
ADD ["src", "."]

# OVERRIDE COMMAND
CMD jmeter --version