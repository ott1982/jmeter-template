FROM openjdk:11-jre-slim
RUN apt update -y && apt install wget -y && wget -P /tmp https://dlcdn.apache.org//jmeter/binaries/apache-jmeter-5.4.1.tgz && tar xfvz /tmp/apache-jmeter-5.4.1.tgz && rm /tmp/apache-jmeter-5.4.1.tgz
ADD template.jmx /tmp
CMD /apache-jmeter-5.4.1/bin/jmeter.sh -n -t /tmp/template.jmx -L WARN -j /dev/stdout -l result.jtl -J URL=www.google.com -J PROTOCOL=https -J PORT=443 && cat result.jtl