# Use an official Python runtime as a parent image
FROM python:3.9-slim

# Use an environment variable for MongoDB URI
ENV MONGO_URI mongodb://localhost:27017/

# Set the working directory in the container
WORKDIR /usr/src/app

# Copy the current directory contents into the container at /usr/src/app
COPY ./app .

# Install any needed packages specified in requirements.txt
# Ensure requirements.txt includes pymongo and python-json-logger
RUN pip install --no-cache-dir -r requirements.txt

# Make port 5000 available to the world outside this container
EXPOSE 5000

# Run app.py when the container launches
CMD ["python", "app.py"]
