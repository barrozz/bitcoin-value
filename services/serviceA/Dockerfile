# Use the official Python image as a base image
FROM python:3.9 AS builder

# Set the working directory inside the container
WORKDIR /app

# Copy the application files into the container
COPY . /app

# Install necessary dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Run the application
CMD ["python", "app.py"]