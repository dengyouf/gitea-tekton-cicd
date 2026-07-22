# java 版本


``` 
java -version
java version "17.0.11" 2024-04-16 LTS
Java(TM) SE Runtime Environment (build 17.0.11+7-LTS-207)
Java HotSpot(TM) 64-Bit Server VM (build 17.0.11+7-LTS-207, mixed mode, sharing)
```

```java
mvn version (3.0+)
```
# 编译代码

``` 
mvn package -DskipTests
```

# 启动服务

```java
java -jar .\target\helloword-0.0.1-SNAPSHOT.jar
```

# 访问服务
```java
http://127.0.0.1:8080/api
```