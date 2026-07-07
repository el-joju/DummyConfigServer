# Usamos una imagen ligera de Java 21
FROM eclipse-temurin:21-jre-alpine

# Definimos un directorio de trabajo
WORKDIR /app

# Copiamos el JAR generado en tu carpeta target (ajusta si usas Gradle a build/libs/)
# El asterisco ayuda a no tener que poner el nombre exacto del archivo con su versión
COPY target/*.jar app.jar

# Exponemos el puerto (esto es opcional y solo documentativo, pero buena práctica)
# Cambia este puerto según el servicio (Ej: 8888 para Config, 8761 para Eureka, etc.)
EXPOSE 9003

# Comando para ejecutar la aplicación
ENTRYPOINT ["java", "-jar", "app.jar"]