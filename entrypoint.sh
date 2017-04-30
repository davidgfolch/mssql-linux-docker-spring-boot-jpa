#!/bin/bash

# Start SQL Server
/opt/mssql/bin/sqlservr.sh &

# Start the script to create the DB and user
/usr/config/configure-db.sh

# Tail the setup logs to trap the process
tail -f /var/opt/mssql/log/setup*.log
