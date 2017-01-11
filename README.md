# docker-mongodb

##Based on official image for 3.2

https://hub.docker.com/_/mongo/
https://github.com/docker-library/mongo/blob/4d7bd01562edefad38a240c40a4b162a1cd7b9c2/3.2/Dockerfile

##You can set admin password using an environment variable now
```
docker run -it --rm -e ADMIN_PASSWORD=password sunshineo/docker-mongodb
```
This will create a user 'admin' in the 'admin' database with the password provided.

## You can overwrite the admin database and admin username too
```
docker run -it --rm \
-p 27017:27017 \
-e ADMIN_DATABASE=myAdminDB \
-e ADMIN_USERNAME=myAdmin \
-e ADMIN_PASSWORD=password \
sunshineo/docker-mongodb
```
But I highly suggest when you overwrite those, instead of using cmd line like above, use this image as base image and create your own docker image and simply export env variables

##Setting the password add about 15 seconds to start time.
Read https://github.com/sunshineo/docker-mongodb/blob/master/new-entrypoint.sh and you will understand.

##That is all. Nothing fancy.
