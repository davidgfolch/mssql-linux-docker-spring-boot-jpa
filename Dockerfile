FROM microsoft/mssql-server-linux:latest

# Create a config directory
RUN mkdir -p /usr/config
WORKDIR /usr/config

# Bundle config source
COPY . /usr/config

# Grant permissions for the configure-db script to be executable
RUN chmod +x /usr/config/configure-db.sh

CMD /bin/bash ./entrypoint.sh
