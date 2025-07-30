# Use the official Nginx image as the base
FROM nginx:alpine

# Remove the default nginx static assets
RUN rm -rf /usr/share/nginx/html/*

# Copy our custom HTML website into the nginx public folder
COPY index.html /usr/share/nginx/html/

# If you have assets like CSS, JS, or images, copy them too (optional)
# COPY css/ /usr/share/nginx/html/css/
# COPY js/ /usr/share/nginx/html/js/
# COPY images/ /usr/share/nginx/html/images/

# Expose port 80
EXPOSE 80

# Start Nginx server
CMD ["nginx", "-g", "daemon off;"]
