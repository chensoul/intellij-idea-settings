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
    config.setAllowedOrigins(java.util.Collections.singletonList("http://localhost:4200"));
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

10. `boot-datasource-postgres-yml` - Spring Boot DataSource and JPA Properties

```properties
spring.datasource.url: jdbc:postgresql://localhost:5432/postgres
spring.datasource.username: postgres
spring.datasource.password: postgres
```
11. `boot-datasource-mysql-yml` - Spring Boot DataSource and JPA Properties

```properties
spring.datasource.url: jdbc:mysql://localhost:3306/test
spring.datasource.username: root
spring.datasource.password: 
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

## SQL

1. `flyway-table` - Flyway table creation script

```sql
create sequence if not exists $table$_id_seq start with 1 increment by 50;

create table if not exists $table$ (
    id bigint DEFAULT nextval('$table$_id_seq') not null,
    created_at timestamp,
    updated_at timestamp,
    primary key (id)
);
```

2. `mysql-create`

```sql
```



## Maven

1. `jib-maven-plugin` - Add Jib Maven Plugin

```xml
<plugin>
    <groupId>com.google.cloud.tools</groupId>
    <artifactId>jib-maven-plugin</artifactId>
    <version>3.2.1</version>
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

2. `git-commit-id-maven-plugin` - Adds git-commit-id-maven-plugin

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

3. `spotless-maven-plugin` - Adds spotless-maven-plugin

```xml
<plugin>
    <groupId>com.diffplug.spotless</groupId>
    <artifactId>spotless-maven-plugin</artifactId>
    <version>2.43.0</version>
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

4. `jacoco-maven-plugin`

```xml
<plugin>
  <groupId>org.jacoco</groupId>
  <artifactId>jacoco-maven-plugin</artifactId>
  <version>0.8.12</version>
  <configuration>
    <rules>
      <rule>
        <element>BUNDLE</element>
        <limits>
          <limit>
            <counter>COMPLEXITY</counter>
            <value>COVEREDRATIO</value>
            <minimum>${jacoco.minimum.coverage}</minimum>
          </limit>
        </limits>
      </rule>
    </rules>
    <excludes>
      <exclude>**/exception/*</exclude>
    </excludes>
  </configuration>
  <executions>
    <execution>
      <id>pre-unit-tests</id>
      <goals>
        <goal>prepare-agent</goal>
      </goals>
    </execution>
    <!-- Ensures that the code coverage report for unit tests is created after unit tests have been run -->
    <execution>
      <id>post-unit-test</id>
      <phase>test</phase>
      <goals>
        <goal>report</goal>
      </goals>
    </execution>
    <execution>
      <id>pre-integration-tests</id>
      <goals>
        <goal>prepare-agent-integration</goal>
      </goals>
    </execution>
    <!-- Ensures that the code coverage report for integration tests is created after integration tests have been run -->
    <execution>
      <id>post-integration-tests</id>
      <phase>post-integration-test</phase>
      <goals>
        <goal>report-integration</goal>
      </goals>
    </execution>
  </executions>
</plugin>
```

5. `spring-boot-maven-plugin-docker`

```xml
<plugin>
  <groupId>org.springframework.boot</groupId>
  <artifactId>spring-boot-maven-plugin</artifactId>
  <executions>
    <execution>
      <goals>
        <goal>build-info</goal>
      </goals>
    </execution>
  </executions>
  <configuration>
    <!--
    mvn spring-boot:build-image \
    -Dspring-boot.build-image.imageName=xx \
    -Dspring-boot.build-image.builder=paketobuildpacks/builder-jammy-full \
    -Dspring-boot.build-image.publish=true
    -->
    <image>
      <name>${env.USER}/${project.artifactId}</name>
      <!-- 该镜像包含 curl -->
      <builder>paketobuildpacks/builder-jammy-full</builder>
      <env>
        <!-- Make sure `mvn spring-boot:build-image` uses the Java version defined in this project -->
        <BP_JVM_VERSION>${java.version}</BP_JVM_VERSION>
      </env>
    </image>
    <docker>
      <publishRegistry>
        <username>${docker.publishRegistry.username}</username>
        <password>${docker.publishRegistry.password}</password>
      </publishRegistry>
    </docker>
    <additionalProperties>
      <java.version>${java.version}</java.version>
    </additionalProperties>
  </configuration>
</plugin>
```

6. `maven-compiler-plugin-springdoc`

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

1. `dockerfile.layered` - Creates multistage Dockerfile for Spring Boot application

```dockerfile
FROM eclipse-temurin:21-jre-jammy AS builder
WORKDIR /build
ADD target/*.jar app.jar
RUN java -Djarmode=layertools -jar app.jar extract

FROM eclipse-temurin:21-jre-jammy
WORKDIR /app
COPY --from=builder /build/dependencies/ ./
COPY --from=builder /build/spring-boot-loader/ ./
COPY --from=builder /build/snapshot-dependencies/ ./
COPY --from=builder /build/application/ ./
EXPOSE 8080
ENTRYPOINT [ "java", "org.springframework.boot.loader.launch.JarLauncher" ]
```

2. `dockerfile`

```dockerfile
FROM eclipse-temurin:21-jre-jammy
COPY target/*.jar app.jar
ENTRYPOINT ["java","-jar","/app.jar"]
```

3. `docker-compose-postgres` 

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

4. `docker-compose-mysql` 

```yaml
mysql:
  image: mysql:8
  ports:
    - "3306:3306"
  environment:
    MYSQL_ROOT_PASSWORD: pass
    MYSQL_DATABASE: $db$
    MYSQL_USER: user
    MYSQL_PASSWORD: pass
  volumes:
    - mysql:/var/lib/mysql
  healthcheck:
    test: "/usr/bin/mysql --user=user --password=pass -e 'SHOW DATABASES;'"
    interval: 5s
    timeout: 5s
    retries: 10
```

5. `docker-compose-mongodb` 

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

6. `docker-compose-redis` 

```yaml
redis:
  image: redis:7
  environment:
    ALLOW_EMPTY_PASSWORD: yes
    REDIS_DISABLE_COMMANDS: FLUSHDB,FLUSHALL
  ports:
    - "6379:6379"
  volumes:
    - redis:/data
  healthcheck:
    test: [ "CMD", "redis-cli","--raw", "incr","ping" ]
    interval: 5s
    timeout: 5s
    retries: 10
```

7. `docker-compose-rabbitmq` 

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

8. `docker-compose-kafka-zk` 

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

9. `docker-compose-zipkin`

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



## References

- https://github.com/mraible/idea-live-templates
