FROM mongo:3.2.9

COPY ./new-entrypoint.sh /new-entrypoint.sh

ENTRYPOINT ["/new-entrypoint.sh"]
CMD ["mongod"]