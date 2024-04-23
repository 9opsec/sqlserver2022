# SQL Server 2022
Repository to hold dockerfile to build a SQL Server 2022 container image

# Usage

To build locally: -<br>
<br>
```docker build -t <<IMAGE_NAME>> https://github.com/dbafromthecold/sqlserver2022.git```


To build using Docker Build Cloud and pull image locally: -<br>
<br>
```
docker buildx build https://github.com/dbafromthecold/sqlserver2022.git`
--builder cloud-dbafromthecold-default `
--tag dbafromthecold/sqlserver2022:latest `
--load
```



To build using Docker Build Cloud and push to Docker Hub: -<br>
<br>
```docker buildx build https://github.com/dbafromthecold/sqlserver2022.git `
--builder cloud-dbafromthecold-default `
--tag dbafromthecold/sqlserver2022:latest `
--push```
