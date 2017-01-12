#!/bin/bash
set -e

if [ -z "$ADMIN_DATABASE" ];
then
    echo "ADMIN_DATABASE not set. Use default 'admin'"
    ADMIN_DATABASE='admin'
fi

if [ -z "$ADMIN_USERNAME" ];
then
    echo "ADMIN_USERNAME not set. Use default 'admin'"
    ADMIN_USERNAME='admin'
fi

if [ -z "$ADMIN_PASSWORD" ];
then
    echo "ADMIN_PASSWORD not set."
else
    echo "ADMIN_PASSWORD set. Start mongod."
    mongod &
    echo "Sleep for 5 seconds to make sure mongod started."
    sleep 5
    echo "Remove existing admin user if already exists."
    echo -e "use $ADMIN_DATABASE\n db.dropUser('$ADMIN_USERNAME');" | mongo
    echo "Set admin password."
    echo -e "use $ADMIN_DATABASE\n db.createUser({ user: '$ADMIN_USERNAME', pwd: '$ADMIN_PASSWORD', roles: [ { role: \"userAdminAnyDatabase\", db: \"admin\" } ] });" | mongo
    echo "Admin password set. Stop mongod."
    pkill -f mongod
    echo "Sleep for 5 seconds to make sure mongod is stopped."
    sleep 5
fi

echo "Call mongo docker image entrypoint to start"
./entrypoint.sh $1