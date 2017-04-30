#!/bin/bash

# wait for MSSQL server to start
export STATUS=0
i=0
while [[ $STATUS -eq 0 ]] || [[ $i -lt 30 ]]; do
	sleep 1
	i=$i+1
	STATUS=$(grep 'Server setup is completed' /var/opt/mssql/log/setup*.log | wc -l)
done

echo ============================================================================
echo ===============        MSSQL SERVER STARTED       ==========================
echo ============================================================================
echo ''

# Prepare setup script with env variables - workaround for sqlcmd (-v seems to work on Windows only)
echo :setvar MSSQL_DB $MSSQL_DB > param_setup.sql
echo :setvar MSSQL_USER $MSSQL_USER > param_setup.sql
echo :setvar MSSQL_PASSWORD $MSSQL_PASSWORD > param_setup.sql
cat setup.sql >> param_setup.sql

# Run the setup script to create the DB and the schema in the DB
/opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P $SA_PASSWORD -d master -i param_setup.sql

echo ''
echo ============================================================================
echo ===============       MSSQL CONFIG COMPLETE       ==========================
echo ============================================================================
