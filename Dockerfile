# Stage 1: Build the application
FROM node:14 as build

WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build

# Stage 2: Serve with nginx
FROM nginx:alpine

# Copy the built application from the build stage
COPY --from=build /app/build /usr/share/nginx/html

# Copy nginx configuration
COPY config/nginx.conf /etc/nginx/nginx.conf

# Expose port 80
EXPOSE 80

