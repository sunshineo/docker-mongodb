#!/bin/bash
set -e

if [ -z "$ADMIN_PASSWORD" ];
then
    echo "ADMIN_PASSWORD not set."
else
    echo "ADMIN_PASSWORD set. Start mongod."
    mongod &
    echo "Sleep for 5 seconds to make sure mongod started."
    sleep 5
    echo "Remove existing admin user if already exists."
    echo -e "use admin\n db.dropUser('admin');" | mongo
    echo "Set admin password."
    echo -e "use admin\n db.createUser({ user: 'admin', pwd: 'password', roles: [ { role: \"userAdminAnyDatabase\", db: \"admin\" } ] });" | mongo
    echo "Admin password set. Stop mongod."
    pkill -f mongod
    echo "Sleep for 5 seconds to make sure mongod is stopped."
    sleep 5
fi

echo "Call old entrypoint to start"
./entrypoint.sh $1