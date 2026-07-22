#FROM maven:3-openjdk-17
FROM 172.16.30.135/devops/maven:3.8.5-openjdk-17-linuxarm64
#设置时区为上海(Asia/Shanghai)
ENV TZ=Asia/Shanghai
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone


WORKDIR /apps
COPY target/helloword-0.0.1-SNAPSHOT.jar /apps/

#JVM 参数
ENV JAVA_OPTS="\
  -server \
  -Xms256m \
  -Xmx512m \
  -XX:MetaspaceSize=256m \
  -XX:MaxMetaspaceSize=512m \
"

EXPOSE 8080

#额外运行参数
ENV PARAMS=""

#使用 exec 形式，避免 sh -c 带来的 PID1 问题并支持参数扩展
ENTRYPOINT ["sh", "-c", "exec java $JAVA_OPTS -jar helloword-0.0.1-SNAPSHOT.jar $PARAMS"]