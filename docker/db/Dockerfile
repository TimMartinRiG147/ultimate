# Use the official MongoDB image from Docker Hub as the base image
FROM mongo:latest

# Optionally, copy a custom MongoDB configuration file
# COPY mongodb.conf /etc/mongo/mongodb.conf

# Optionally, copy initialization scripts or predefined data
# COPY init-db.d/ /docker-entrypoint-initdb.d/

# Expose the default MongoDB port
EXPOSE 27017

# Set default environment variables (if necessary)
ENV MONGO_INITDB_ROOT_USERNAME=admin
ENV MONGO_INITDB_ROOT_PASSWORD=password

# MongoDB data directory (optional to specify)
VOLUME [ "/data/db" ]

# Use the default command for the mongo image which is `mongod`
# with the above configuration file, it could be:
# CMD ["mongod", "--config", "/etc/mongo/mongodb.conf"]
