FROM mongo:3.2.9

COPY ./docker-mongodb-entrypoint.sh /docker-mongodb-entrypoint.sh

ENTRYPOINT ["/docker-mongodb-entrypoint.sh"]
CMD ["mongod"]