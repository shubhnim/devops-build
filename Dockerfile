# Using NGINX to serve the pre-built static files
FROM nginx:alpine
COPY devops-build/build /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]

