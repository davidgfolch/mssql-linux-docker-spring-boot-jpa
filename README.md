# spring-boot-mssqlserver

You need to install sqljdbc driver before run:

Download from: [microsoft.com](https://www.microsoft.com/en-us/download/confirmation.aspx?id=55539)

Unzip in your home folder (linux)

Install in maven local repository (example for sqljdbc_6.2 / jre8):
````
cd ~/sqljdbc_6.2/enu
mvn install:install-file -Dfile=mssql-jdbc-6.2.2.jre8.jar -Dpackaging=jar -DgroupId=com.microsoft.sqlserver -DartifactId=sqljdbc6-jre8 -Dversion=6.2
````

Update pom.xml for your sql driver version:
````xml
<dependency>
    <groupId>com.microsoft.sqlserver</groupId>
    <artifactId>sqljdbc6-jre8</artifactId>
    <version>6.2</version>
</dependency>
````