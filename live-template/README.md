# Intellij IDEA LiveTemplates

These are my custom [IntelliJ IDEA Live Templates](https://www.jetbrains.com/help/idea/using-live-templates.html) for Java that I am currently using.

## Export and Import

You can import LiveTemplates by File -> Manage IDE Settings -> Import Settings -> Select settings.zip

You can export LiveTemplates by File -> Manage IDE Settings -> Export Settings -> Select Live Templates -> Ok

## Java

1. `log` - Adds SLF4J Logger

```java
private static final org.slf4j.Logger log = org.slf4j.LoggerFactory.getLogger($CLASS$.class);
```

## JPA

1. `jpa-entity` - JPA Entity

```java
@jakarta.persistence.Entity
class $entity$ {

    @jakarta.persistence.Id
    @jakarta.persistence.GeneratedValue
    private java.lang.Long id;
    private java.lang.String name;

    public $entity$() {}

    public $entity$(String name) {
        this.name = name;
    }

    public java.lang.Long getId() {
        return id;
    }

    public void setId(java.lang.Long id) {
        this.id = id;
    }

    public java.lang.String getName() {
        return name;
    }

    public void setName(java.lang.String name) {
        this.name = name;
    }

    @java.lang.Override
    public java.lang.String toString() {
        return "$entity${" +
                "id=" + id +
                ", name='" + name + '\'' +
                '}';
    }
}
```

2. `jpa-entity-lombok` - JPA Entity with Lombok

```java
@lombok.Setter
@lombok.Getter
@lombok.AllArgsConstructor
@lombok.NoArgsConstructor
@jakarta.persistence.Entity
class $name$ {
    @jakarta.persistence.Id
    @jakarta.persistence.GeneratedValue
    private Long id;
    private String name;
}
```

3. `jpa-entity-id-seq` - JPA Entity Id of Sequence Generator Type

```java
@jakarta.persistence.Id
@jakarta.persistence.GeneratedValue(strategy = jakarta.persistence.GenerationType.SEQUENCE, generator = "$table$_id_generator")
@jakarta.persistence.SequenceGenerator(name = "$table$_id_generator", sequenceName = "$table$_id_seq", allocationSize = 50)
private Long id;
```

4. `jpa-many-to-many` - JPA Entity property of ManyToMany Type

```java
@jakarta.persistence.ManyToMany(cascade = {jakarta.persistence.CascadeType.PERSIST, jakarta.persistence.CascadeType.MERGE})
@jakarta.persistence.JoinTable(
        name = "$join_table_name$",
        joinColumns = {@jakarta.persistence.JoinColumn(name = "$id_column$", referencedColumnName = "$id_ref_column$")},
        inverseJoinColumns = {@jakarta.persistence.JoinColumn(name =  "$id_join_column$", referencedColumnName =  "$id_ref_join_column$")})
private Set<$CLASS$> $name$;

```

## SpringBoot

1. `boot-controller` - SpringMVC REST Controller

```java
@lombok.extern.slf4j.Slf4j
@org.springframework.web.bind.annotation.RestController
@org.springframework.web.bind.annotation.RequestMapping("/api")
@lombok.RequiredArgsConstructor
class $CLASS$ {
    
}
```

2. `boot-service` - SpringBoot Service

```java
@lombok.extern.slf4j.Slf4j
@org.springframework.stereotype.Service
@org.springframework.transaction.annotation.Transactional
@lombok.RequiredArgsConstructor
public class $CLASS$ {

}
```

3. `boot-app-properties` - SpringBoot ApplicationProperties binding class

```java
@org.springframework.boot.context.properties.ConfigurationProperties(prefix = "$prefix$")
@lombok.Data
public class ApplicationProperties {
    
}
```

4. `boot-runner` - SpringBoot CommandLineRunner

```java
@org.springframework.stereotype.Component
public class $CLASS$ implements org.springframework.boot.CommandLineRunner {
    
    @Override
    public void run(String... args) throws Exception {
        
    }
}
```

5. `boot-add-cors-mappings` - SpringBoot WebMvcConfig addCorsMappings

```java
@Override
public void addCorsMappings(org.springframework.web.servlet.config.annotation.CorsRegistry registry) {
    registry.addMapping("/api/**")
            .allowedMethods("*")
            .allowedHeaders("*")
            .allowedOriginPatterns("*")
            .allowCredentials(true);
}
```

6. `boot-cors-filter` - SpringBoot CORS Filter

```java
@org.springframework.context.annotation.Bean
public org.springframework.boot.web.servlet.FilterRegistrationBean simpleCorsFilter() {
    org.springframework.web.cors.UrlBasedCorsConfigurationSource source = new org.springframework.web.cors.UrlBasedCorsConfigurationSource();
    org.springframework.web.cors.CorsConfiguration config = new org.springframework.web.cors.CorsConfiguration();
    config.setAllowCredentials(true);
    config.setAllowedOrigins(java.util.Collections.singletonList("*"));
    config.setAllowedMethods(java.util.Collections.singletonList("*"));
    config.setAllowedHeaders(java.util.Collections.singletonList("*"));
    source.registerCorsConfiguration("/**", config);
    org.springframework.boot.web.servlet.FilterRegistrationBean bean = new org.springframework.boot.web.servlet.FilterRegistrationBean(new org.springframework.web.filter.CorsFilter(source));
    bean.setOrder(org.springframework.core.Ordered.HIGHEST_PRECEDENCE);
    return bean;
}
```

7. `boot-openapi-config` - SpringBoot OpenAPI Configuration

```java
import io.swagger.v3.oas.annotations.OpenAPIDefinition;
import io.swagger.v3.oas.annotations.info.Info;
import org.springframework.context.annotation.Configuration;

@Configuration(proxyBeanMethods = false)
@OpenAPIDefinition(info = @Info(title = "app", version = "v1"))
class OpenApiConfig {
}
```

8. `boot-mvc-test` - SpringMVC Test method

```java
@org.springframework.beans.factory.annotation.Autowired
private org.springframework.test.web.servlet.MockMvc mockMvc;

@org.junit.jupiter.api.Test
void test$Function$() throws java.lang.Exception {
    var request = org.springframework.test.web.servlet.request.MockMvcRequestBuilders
            .post("")
            .contentType(org.springframework.http.MediaType.APPLICATION_JSON);

    mockMvc.perform(request)
            .andExpect(org.springframework.test.web.servlet.result.MockMvcResultMatchers.status().isCreated())
            .andExpect(org.springframework.test.web.servlet.result.MockMvcResultMatchers.content().contentType(org.springframework.http.MediaType.APPLICATION_JSON))
            .andExpect(org.springframework.test.web.servlet.result.MockMvcResultMatchers.jsonPath("", org.hamcrest.Matchers.is("")));
}
```

9. `boot-dynamic-property-source` - Spring Boot DynamicPropertySource

```java
@org.springframework.test.context.DynamicPropertySource
static void configureProperties(org.springframework.test.context.DynamicPropertyRegistry registry) {
    registry.add("", $END$);
}
```

## Yaml

1. `mysql-datasource-yml` - MySql DataSource config for yaml

```yaml
spring:
  datasource:
    driver-class-name: com.mysql.cj.jdbc.Driver
    url: jdbc:mysql://localhost.:3306/$database$?connectTimeout=60000&socketTimeout=60000&allowMultiQueries=true&useUnicode=true&characterEncoding=UTF-8&useSSL=false&serverTimezone=Asia/Shanghai
    username: root
    password: 
    type: com.zaxxer.hikari.HikariDataSource
    hikari:
      minimum-idle: 16
      maximum-pool-size: 16
      connection-timeout: 30000 #等待连接池分配连接的最大时长，默认30秒
      connection-test-query: 'SELECT 1'
      idle-timeout: 12000 #最大连接数和最小连接数不等时有效
 ```

## Testcontainers

1. `tc-propertysource-postgres` - Spring Boot TestPropertySource with Testcontainers magic JDBC URL

```java
@org.springframework.test.context.TestPropertySource(properties = {
        "spring.test.database.replace=none",
        "spring.datasource.url=jdbc:tc:postgresql:17:///db"
})
```

2. `tc-container-postgres` - PostgreSQLContainer

```java
@org.testcontainers.junit.jupiter.Container
static org.testcontainers.containers.PostgreSQLContainer<?> postgres =
        new org.testcontainers.containers.PostgreSQLContainer<>("postgres:17");
```

## Maven

1. `maven-jib-plugin` - Add Jib Maven Plugin

```xml
<plugin>
    <groupId>com.google.cloud.tools</groupId>
    <artifactId>jib-maven-plugin</artifactId>
    <version>3.4.4</version>
    <configuration>
        <from>
            <image>eclipse-temurin:21-jre-jammy</image>
        </from>
        <to>
            <image>${env.USER}/${project.artifactId}</image>
            <tags>
                <tag>latest</tag>
                <tag>${project.version}</tag>
            </tags>
        </to>
        <container>
            <ports>
                <port>8080</port>
            </ports>
        </container>
    </configuration>
</plugin>
```

2. `maven-git-commit-id-plugin` - Adds git-commit-id-maven-plugin

```xml
<plugin>
    <groupId>io.github.git-commit-id</groupId>
    <artifactId>git-commit-id-maven-plugin</artifactId>
    <executions>
        <execution>
            <goals>
                <goal>revision</goal>
            </goals>
        </execution>
    </executions>
    <configuration>
        <dateFormatTimeZone>${user.timezone}</dateFormatTimeZone>
        <failOnNoGitDirectory>false</failOnNoGitDirectory>
        <failOnUnableToExtractRepoInfo>false</failOnUnableToExtractRepoInfo>
        <generateGitPropertiesFile>true</generateGitPropertiesFile>
        <includeOnlyProperties>
            <includeOnlyProperty>^git.branch$</includeOnlyProperty>
            <includeOnlyProperty>^git.commit.id.abbrev$</includeOnlyProperty>
            <includeOnlyProperty>^git.commit.user.name$</includeOnlyProperty>
            <includeOnlyProperty>^git.commit.message.full$</includeOnlyProperty>
        </includeOnlyProperties>
    </configuration>
</plugin>
```

3. `maven-spotless-plugin` - Adds spotless-maven-plugin

```xml
<plugin>
    <groupId>com.diffplug.spotless</groupId>
    <artifactId>spotless-maven-plugin</artifactId>
    <version>2.44.2</version>
    <configuration>
        <java>
            <importOrder />
            <removeUnusedImports />
            <palantirJavaFormat>
                <version>2.50.0</version>
            </palantirJavaFormat>
            <formatAnnotations />
        </java>
    </configuration>
    <executions>
        <execution>
            <phase>compile</phase>
            <goals>
                <goal>check</goal>
            </goals>
        </execution>
    </executions>
</plugin>
```

4. `maven-jacoco-plugin`

```xml
<plugin>
    <groupId>org.jacoco</groupId>
    <artifactId>jacoco-maven-plugin</artifactId>
    <version>0.8.13</version>
    <executions>
        <!-- Run JaCoCo after tests -->
        <execution>
            <id>prepare-agent</id>
            <goals>
                <goal>prepare-agent</goal>
            </goals>
        </execution>
        <execution>
            <id>report</id>
            <phase>verify</phase>
            <goals>
                <goal>report</goal>
            </goals>
        </execution>
        <execution>
            <id>check</id>
            <phase>verify</phase>
            <goals>
                <goal>check</goal>
            </goals>
            <configuration>
                <rules>
                    <rule>
                        <element>BUNDLE</element>
                        <limits>
                            <limit>
                                <counter>LINE</counter>
                                <value>COVEREDRATIO</value>
                                <minimum>${jacoco.minimum.coverage}</minimum>
                            </limit>
                        </limits>
                    </rule>
                </rules>
            </configuration>
        </execution>
    </executions>
</plugin>
```

5. `maven-compiler-plugin-springdoc`

```xml
<plugin>
  <groupId>org.apache.maven.plugins</groupId>
  <artifactId>maven-compiler-plugin</artifactId>
  <configuration>
    <annotationProcessorPaths>
      <!-- https://springdoc.org/#javadoc-support -->
      <path>
        <groupId>com.github.therapi</groupId>
        <artifactId>therapi-runtime-javadoc-scribe</artifactId>
        <version>0.15.0</version>
      </path>

      <path>
        <groupId>org.projectlombok</groupId>
        <artifactId>lombok</artifactId>
        <version>1.18.34</version>
      </path>
    </annotationProcessorPaths>
  </configuration>
</plugin>
```

## Docker

1. `dockerfile-boot` - Creates multistage Dockerfile for Spring Boot application

```dockerfile
FROM eclipse-temurin:21-jre AS builder
WORKDIR /app
ADD target/*.jar app.jar
RUN java -Djarmode=layertools -jar app.jar extract

FROM eclipse-temurin:21-jre
WORKDIR /app
COPY --from=builder app/dependencies/ ./
COPY --from=builder app/spring-boot-loader/ ./
COPY --from=builder app/snapshot-dependencies/ ./
COPY --from=builder app/application/ ./
EXPOSE 8080
ENTRYPOINT [ "java", "org.springframework.boot.loader.launch.JarLauncher" ]
```

2. `dockerfile-java`

```dockerfile
FROM eclipse-temurin:21-jre-jammy
COPY target/*.jar app.jar
ENTRYPOINT ["java","-jar","/app.jar"]
```

2. `dc-postgres` 

```yaml
postgres:
  image: postgres:17
  environment:
    POSTGRES_DB: $db$
    POSTGRES_USER: user
    POSTGRES_PASSWORD: pass
    POSTGRES_HOST_AUTH_METHOD: trust
    PGDATA: /data/postgres
  volumes:
    - postgres:/data/postgres
  ports:
    - "5432:5432"
  healthcheck:
    test: [ 'CMD-SHELL', 'pg_isready -U $${POSTGRES_USER}' ]
    interval: 5s
    timeout: 5s
    retries: 10
```

3. `dc-mysql` 

```yaml
 mysql:
  image: mysql:9
  restart: always
  environment:
    MYSQL_ROOT_HOST: '%'
    MYSQL_DATABASE: $db$
    MYSQL_ROOT_PASSWORD: ${MYSQL_ROOT_PASSWORD:-password}
  ports:
    - "3306:3306"
  command:
    --character-set-server=utf8mb4
    --collation-server=utf8mb4_general_ci
    --explicit_defaults_for_timestamp=true
    --lower_case_table_names=1  
  healthcheck:
    test: [ "CMD", "mysqladmin", "ping", "-h", "localhost", "-uroot", "-p${MYSQL_ROOT_PASSWORD:-password}" ]
    interval: 5s
    timeout: 5s
    retries: 10
  volumes:
    - ./sql:/docker-entrypoint-initdb.d:ro  
```

4. `dc-mongodb` 

```yaml
mongodb:
  image: mongo:8
  ports:
    - "27017:27017"
  environment:
    MONGO_INITDB_DATABASE: $db$
    MONGO_INITDB_ROOT_USERNAME: user
    MONGO_INITDB_ROOT_PASSWORD: pass
  healthcheck:
    test: echo 'db.runCommand("ping").ok' | mongosh mongodb://user:pass@localhost:27017/?authSource=admin --quiet
    interval: 5s
    timeout: 2s
    retries: 10
```

5. `dc-redis` 

```yaml
redis:
  image: redis:7
  environment:
    ALLOW_EMPTY_PASSWORD: yes
    REDIS_DISABLE_COMMANDS: FLUSHDB,FLUSHALL
  ports:
    - "6379:6379"
  healthcheck:
    test: [ "CMD", "redis-cli", "ping" ]
    interval: 5s
    timeout: 5s
    retries: 10
```

6. `dc-rabbitmq` 

```yaml
rabbitmq:
  image: rabbitmq:4-management-alpine
  ports:
    - "5672:5672"
    - "15672:15672"
  volumes:
    - rabbitmq:/var/lib/rabbitmq
  healthcheck:
    test: [ "CMD", "rabbitmqctl", "status" ]
    interval: 5s
    timeout: 2s
    retries: 10
```

7. `dc-kafka-zk` 

```yaml
kafka:
  image: confluentinc/cp-kafka:7.7.1
  container_name: kafka
  ports:
    - "9092:9092"
  environment:
    KAFKA_BROKER_ID: 1
    KAFKA_ZOOKEEPER_CONNECT: 'zookeeper:2181'
    KAFKA_LISTENER_SECURITY_PROTOCOL_MAP: PLAINTEXT:PLAINTEXT,PLAINTEXT_INTERNAL:PLAINTEXT
    KAFKA_ADVERTISED_LISTENERS: PLAINTEXT://localhost:9092,PLAINTEXT_INTERNAL://kafka:29092
    KAFKA_OFFSETS_TOPIC_REPLICATION_FACTOR: 1
    KAFKA_TRANSACTION_STATE_LOG_MIN_ISR: 1
    KAFKA_TRANSACTION_STATE_LOG_REPLICATION_FACTOR: 1
  depends_on:
    - zookeeper

zookeeper:
  image: confluentinc/cp-zookeeper:7.7.1
  ports:
    - "2181:2181"
  environment:
    ZOOKEEPER_CLIENT_PORT: 2181
    ZOOKEEPER_TICK_TIME: 2000
```

8. `dc-zipkin`

```yaml
zipkin:
  image: openzipkin/zipkin
  environment:
    - JAVA_OPTS=-XX:+UnlockExperimentalVMOptions -Djava.security.egd=file:/dev/./urandom
  ports:
    - "9411:9411"
  healthcheck:
    test: [ "CMD", "curl", "-I", "http://zipkin:9411" ]
    interval: 5s
    timeout: 5s
    retries: 10
```

