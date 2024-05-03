# Use the official MongoDB image from Docker Hub as the base image
FROM mongo:latest

# Expose the default MongoDB port
EXPOSE 27017

# Set default environment variables (if necessary)
ENV MONGO_INITDB_ROOT_USERNAME=admin
ENV MONGO_INITDB_ROOT_PASSWORD=password

# MongoDB data directory (optional to specify)
VOLUME [ "/data/db" ]