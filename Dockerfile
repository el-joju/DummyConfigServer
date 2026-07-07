# --- ETAPA 1: COMPILACIÓN ---
# Usamos una imagen de Maven con Java 21 para compilar el código fuente
FROM maven:3.9.6-eclipse-temurin-21-alpine AS build
WORKDIR /app

# Copiamos el archivo de configuración de Maven
COPY pom.xml .

# Copiamos el código fuente de tu microservicio
COPY src ./src

# Compilamos y generamos el archivo .jar dentro del contenedor
RUN mvn clean package -DskipTests

# --- ETAPA 2: IMAGEN FINAL DE EJECUCIÓN ---
# Usamos la imagen ligera de ejecución que ya conoces
FROM eclipse-temurin:21-jre-alpine
WORKDIR /app

# En lugar de copiar de tu laptop, copiamos el .jar generado en la ETAPA 1
COPY --from=build /app/target/*.jar app.jar

# Exponemos el puerto correspondiente (ej: 9003, 9000, etc.)
EXPOSE 9003

ENTRYPOINT ["java", "-jar", "app.jar"]