FROM ubuntu:22.04

# create mssql user
RUN useradd -u 10001 mssql

# installing SQL Server
RUN apt-get update && apt-get install -y curl software-properties-common apt-transport-https
RUN curl https://packages.microsoft.com/keys/microsoft.asc | tee /etc/apt/trusted.gpg.d/microsoft.asc
RUN curl -fsSL https://packages.microsoft.com/config/ubuntu/22.04/mssql-server-2022.list | tee /etc/apt/sources.list.d/mssql-server-2022.list
RUN apt-get update && apt-get install -y mssql-server

# creating directories
RUN mkdir /var/opt/sqlserver
RUN mkdir /var/opt/sqlserver/data
RUN mkdir /var/opt/sqlserver/log
RUN mkdir /var/opt/sqlserver/backups

# set permissions on directories
RUN chown -R mssql:mssql /var/opt/mssql
RUN chown -R mssql:mssql /var/opt/sqlserver

# set environment variables
ENV ACCEPT_EULA="Y"
ENV MSSQL_PID="Developer"
ENV MSSQL_AGENT_ENABLED=True
ENV MSSQL_DATA_DIR=/var/opt/sqlserver/sqldata
ENV MSSQL_LOG_DIR=/var/opt/sqlserver/sqllog
ENV MSSQL_BACKUP_DIR=/var/opt/sqlserver/sqlbackups

# switch to mssql user
USER mssql

# start sql server
CMD /opt/mssql/bin/sqlservr