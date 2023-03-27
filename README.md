# debezium-example
The Debezium SQL Server Connector is a tool that allows you to monitor and capture data changes in SQL Server databases and stream them to various downstream systems for further processing.

This readme file provides information about how to use the Debezium SQL Server Connector to capture data changes in your SQL Server database.

In docker-compose.yml file, we have four services defined:

zookeeper: runs a Zookeeper instance required by Kafka
kafka: runs a Kafka broker instance
sqlserver: runs a SQL Server instance
debezium: runs the Debezium SQL Server Connector

To start the services, run:

'''sh
docker-compose up -d
This will start all the services in the background. To stop them, run:
'''

docker-compose down
You can now use the Debezium SQL Server Connector to capture data changes from your SQL Server database by sending configuration requests to the debezium service running on port 8083.
