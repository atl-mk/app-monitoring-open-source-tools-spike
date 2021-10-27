curl -L https://repo1.maven.org/maven2/io/prometheus/jmx/jmx_prometheus_javaagent/0.16.1/jmx_prometheus_javaagent-0.16.1.jar > jmx-exporter.jar
nohup atlas-run-standalone -p 5990 -ajp 8009 --product refapp --version 5.4.1 -Drefapp.profiling.enabled -DskipTests --jvmargs "-javaagent:jmx-exporter.jar=9000:jmx-exporter-config.yml -Datlassian.org.osgi.framework.bootdelegation.extra=io.prometheus.*" &
nohup atlas-run-standalone -p 5991 -ajp 8010 --product refapp --version 5.4.2 -Drefapp.profiling.enabled -DskipTests --jvmargs "-javaagent:jmx-exporter.jar=9001:jmx-exporter-config.yml -Datlassian.org.osgi.framework.bootdelegation.extra=io.prometheus.*" &
docker run -d --name prometheus -p 9090:9090 --network="host" -v prometheus:/etc/prometheus prom/prometheus
docker run -d --name grafana --network="host" -p 3000:3000 grafana/grafana