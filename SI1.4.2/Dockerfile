FROM tomcat:8.5-jdk8

# Establecer el directorio de trabajo
WORKDIR /usr/local/tomcat/webapps/

# Copiar la carpeta SI y su contenido
COPY ./SI /usr/local/tomcat/webapps/SI/

# Copiar el conector de MySQL y JSTL a la carpeta de librerías de Tomcat
COPY ./SI/WEB-INF/lib/mysql-connector-java-1.9.0.jar /usr/local/tomcat/lib/
COPY ./SI/WEB-INF/lib/jstl.jar /usr/local/tomcat/lib/  

# Exponer el puerto 8080
EXPOSE 8080

# Comando de inicio de Tomcat
CMD ["catalina.sh", "run"]
