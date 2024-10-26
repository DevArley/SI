FROM tomcat:8.5-jdk8

# Establecer el directorio de trabajo
WORKDIR /usr/local/tomcat/webapps/

# Copiar la carpeta SI y su contenido
COPY ./SI1.4.2 /usr/local/tomcat/webapps/SI1.4.2/

# Copiar el conector de MySQL y JSTL a la carpeta de librerías de Tomcat
COPY ./SI1.4.2/WEB-INF/lib/mysql-connector-java-5.1.12-bin.jar /usr/local/tomcat/lib/
COPY ./SI1.4.2/WEB-INF/lib/jstl-1.2.jar /usr/local/tomcat/lib/  

# Exponer el puerto 8080
EXPOSE 8080

# Comando de inicio de Tomcat
CMD ["catalina.sh", "run"]
