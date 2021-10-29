FROM openjdk:11-jre-slim
ADD https://dlcdn.apache.org/jmeter/binaries/apache-jmeter-5.4.1.tgz $HOME/
CMD jmeter -n -t template.jmx -L WARN -j /dev/stdout -J URL=www.google.com -J PROTOCOL=https -J PORT=443