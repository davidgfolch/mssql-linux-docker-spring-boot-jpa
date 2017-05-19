#!/bin/bash

# wait for MSSQL server to start
export STATUS=0
i=0
while [[ $STATUS -eq 0 ]] || [[ $i -lt 30 ]]; do
	sleep 1
	i=$i+1
	STATUS=$(grep 'Recovery is complete' /var/opt/mssql/log/errorlog* | wc -l)
done

echo "======= MSSQL SERVER STARTED ========" | tee -a ./config.log
# Run the setup script to create the DB and the schema in the DB
/opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P $SA_PASSWORD -d master -i setup.sql

echo "======= MSSQL CONFIG COMPLETE =======" | tee -a ./config.log
