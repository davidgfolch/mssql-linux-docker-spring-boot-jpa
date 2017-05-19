FROM microsoft/mssql-server-linux:latest

# Create a config directory
RUN mkdir -p /usr/config
WORKDIR /usr/config

# Bundle config source
COPY . /usr/config

# Grant permissions for to our scripts to be executable
RUN chmod +x /usr/config/entrypoint.sh
RUN chmod +x /usr/config/configure-db.sh

ENTRYPOINT ["./entrypoint.sh"]

# Tail the setup logs to trap the process
CMD ["tail -f /var/opt/mssql/log/errorlog*"]

HEALTHCHECK --interval=15s CMD grep -q "MSSQL CONFIG COMPLETE" ./config.log
