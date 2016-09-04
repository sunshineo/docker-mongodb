# docker-mongodb

##Based on official image for 3.2

https://hub.docker.com/_/mongo/
https://github.com/docker-library/mongo/blob/4d7bd01562edefad38a240c40a4b162a1cd7b9c2/3.2/Dockerfile

##You can set admin password using an environment variable now
```
docker run -it --rm -e ADMIN_PASSWORD=password sunshineo/mongo
```
##The username is 'admin'. I will make it a env var in future if I have time.

##Setting the password cost about 15 seconds.
Read https://github.com/sunshineo/docker-mongodb/blob/master/new-entrypoint.sh and you will understand.

##That is all. Nothing fancy.
