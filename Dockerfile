# Stage 1: Build the application
FROM node:14 as build

WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build

# Stage 2: Set up Nginx and serve the application
FROM ubuntu:20.04

# Install Nginx and other dependencies
RUN apt-get update && \
    apt-get install -y nginx && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
    
# Copy the built application from the build stage
COPY --from=build /app/build /usr/share/nginx/html

# Copy nginx configuration
COPY config/nginx.conf /etc/nginx/nginx.conf

# Expose port 80
EXPOSE 80



