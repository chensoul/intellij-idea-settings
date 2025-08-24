# Live Templates Usage Examples

This directory contains practical examples of how to use the live templates in real-world scenarios.

## 📁 Examples Structure

- `spring-boot-project/` - Complete Spring Boot project setup using templates
- `jpa-entities/` - JPA entity examples with different configurations
- `docker-setup/` - Docker and containerization examples
- `testing/` - Testing setup examples with Testcontainers

## 🚀 Quick Start Examples

### 1. Creating a Spring Boot REST Controller

Type `boot-controller` + Tab:

```java
@lombok.extern.slf4j.Slf4j
@org.springframework.web.bind.annotation.RestController
@org.springframework.web.bind.annotation.RequestMapping("/api")
@lombok.RequiredArgsConstructor
class UserController {
    
}
```

Then add your endpoints:

```java
@lombok.extern.slf4j.Slf4j
@org.springframework.web.bind.annotation.RestController
@org.springframework.web.bind.annotation.RequestMapping("/api")
@lombok.RequiredArgsConstructor
class UserController {
    
    private final UserService userService;
    
    @GetMapping("/users")
    public List<User> getAllUsers() {
        return userService.findAll();
    }
    
    @PostMapping("/users")
    public User createUser(@RequestBody User user) {
        return userService.save(user);
    }
}
```

### 2. Creating a JPA Entity

Type `jpa-entity-lombok` + Tab and enter "User" as the name:

```java
@lombok.Setter
@lombok.Getter
@lombok.AllArgsConstructor
@lombok.NoArgsConstructor
@jakarta.persistence.Entity
class User {
    @jakarta.persistence.Id
    @jakarta.persistence.GeneratedValue
    private Long id;
    private String name;
}
```

### 3. Creating a Service Class

Type `boot-service` + Tab:

```java
@lombok.extern.slf4j.Slf4j
@org.springframework.stereotype.Service
@org.springframework.transaction.annotation.Transactional
@lombok.RequiredArgsConstructor
public class UserService {

}
```

### 4. Adding Docker Support

Type `dockerfile.layered` + Tab to create an optimized Dockerfile:

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

## 🔄 Common Workflows

### Setting up a new Spring Boot microservice

1. **Create the main application class** with `log` template for logging
2. **Create configuration class** with `boot-app-properties` template
3. **Create entities** with `jpa-entity-lombok` template
4. **Create services** with `boot-service` template
5. **Create controllers** with `boot-controller` template
6. **Add Docker support** with `dockerfile.layered` template
7. **Add database** with `docker-compose-postgres` template

### Setting up testing

1. **Add Testcontainers** with `tc-container-postgres` template
2. **Create test properties** with `tc-propertysource-postgres` template
3. **Add MVC tests** with `boot-mvc-test` template

## 📝 Template Combinations

Many templates work well together. Here are some common combinations:

### Complete Entity Setup
```java
// 1. Use jpa-entity-lombok template
@lombok.Setter
@lombok.Getter
@lombok.AllArgsConstructor
@lombok.NoArgsConstructor
@jakarta.persistence.Entity
class Product {
    // 2. Use jpa-entity-id-seq template for the ID
    @jakarta.persistence.Id
    @jakarta.persistence.GeneratedValue(strategy = jakarta.persistence.GenerationType.SEQUENCE, generator = "product_id_generator")
    @jakarta.persistence.SequenceGenerator(name = "product_id_generator", sequenceName = "product_id_seq", allocationSize = 50)
    private Long id;
    
    private String name;
    private BigDecimal price;
    
    // 3. Use jpa-many-to-many template for relationships
    @jakarta.persistence.ManyToMany(cascade = {jakarta.persistence.CascadeType.PERSIST, jakarta.persistence.CascadeType.MERGE})
    @jakarta.persistence.JoinTable(
            name = "product_categories",
            joinColumns = {@jakarta.persistence.JoinColumn(name = "product_id", referencedColumnName = "id")},
            inverseJoinColumns = {@jakarta.persistence.JoinColumn(name = "category_id", referencedColumnName = "id")})
    private Set<Category> categories;
}
```

### Complete Service Layer
```java
// 1. Use log template
private static final org.slf4j.Logger log = org.slf4j.LoggerFactory.getLogger(ProductService.class);

// 2. Use boot-service template
@lombok.extern.slf4j.Slf4j
@org.springframework.stereotype.Service
@org.springframework.transaction.annotation.Transactional
@lombok.RequiredArgsConstructor
public class ProductService {
    
    private final ProductRepository productRepository;
    
    public List<Product> findAll() {
        log.info("Finding all products");
        return productRepository.findAll();
    }
    
    public Product save(Product product) {
        log.info("Saving product: {}", product.getName());
        return productRepository.save(product);
    }
}
```

## 🎯 Tips for Effective Usage

1. **Learn the abbreviations**: Memorize common template abbreviations for faster development
2. **Customize variables**: Use meaningful variable names when prompted
3. **Combine templates**: Use multiple templates together for complete class setup
4. **Consistent naming**: Follow consistent naming conventions across your project
5. **Team sharing**: Share customized templates with your team for consistency

## 🔧 Customization Examples

You can modify templates to match your coding standards:

### Custom Logger Template
Instead of the default `log` template, you might prefer:
```java
private static final Logger logger = LoggerFactory.getLogger($CLASS$.class);
```

### Custom Entity Template
Add audit fields to your entity template:
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
    
    @CreatedDate
    private LocalDateTime createdAt;
    
    @LastModifiedDate
    private LocalDateTime updatedAt;
    
    private String name;
}
```

## 📚 Additional Resources

- [IntelliJ IDEA Live Templates Documentation](https://www.jetbrains.com/help/idea/using-live-templates.html)
- [Spring Boot Documentation](https://spring.io/projects/spring-boot)
- [JPA Documentation](https://jakarta.ee/specifications/persistence/)
- [Docker Documentation](https://docs.docker.com/)
- [Testcontainers Documentation](https://www.testcontainers.org/)
