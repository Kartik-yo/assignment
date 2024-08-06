# Stage 1: Build the application
FROM node:14 as build

WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build

# Stage 2: Serve with nginx
FROM nginx:alpine
RUN apt install nginx

# Copy the built application from the build stage
COPY --from=build /app/build /usr/share/nginx/html

# Copy nginx configuration file from the repository
COPY nginx.conf /etc/nginx/nginx.conf

# Expose port 80 for the application
EXPOSE 80

# Start Nginx
CMD ["nginx", "-g", "daemon off;"]


