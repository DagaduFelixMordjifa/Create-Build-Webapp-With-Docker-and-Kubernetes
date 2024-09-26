# Use the official Nginx image
FROM nginx:alpine

# Copy all files from the current directory into the Nginx web root
COPY . /usr/share/nginx/html

# Expose port 80
EXPOSE 80

# Start Nginx
CMD ["nginx", "-g", "daemon off;"]
