#!/bin/sh

echo "Running MongoDB"
/root/scripts/run_mongo.sh mongod &

echo "Running PostgreSQL"
/run_postgres.sh postgres &

echo "Running Jenkins Slave"
jenkins-slave -url http://jenkins-server:port <secret> <agent name>
