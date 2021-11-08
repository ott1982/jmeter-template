# JMeter template



# Run

```
docker build -t jmeter . && docker run --rm jmeter
```



```
rm result.jtl || jmeter -n -t template.jmx -L WARN -j /dev/stdout -l result.jtl -J URL=www.google.com -J PROTOCOL=https -J PORT=443 && sleep 5 && cat result.jtl
```

