#!/bin/env bash

echo "Running MongoDB"
/root/scripts/run_mongo.sh mongod &

echo "Running PostgreSQL"
/root/scripts/run_postgres.sh postgres &

echo "Running Jenkins Slave"
/root/scripts/run_slave.sh 
