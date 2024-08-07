# Stage 1: Build the application
FROM node:14 as build

WORKDIR /app
COPY client/package.json client/yarn.lock ./
RUN yarn install
COPY . .
RUN yarn build

# Stage 2: Serve with nginx
FROM nginx:alpine
COPY nginx.conf /etc/nginx/conf.d/default.conf
COPY --from=build /app/build /usr/share/nginx/html

# Expose port 80 for the application
EXPOSE 80

# Start Nginx
CMD ["nginx", "-g", "daemon off;"]


