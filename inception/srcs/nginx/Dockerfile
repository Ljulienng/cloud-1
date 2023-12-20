FROM debian:bullseye

LABEL author="Julien Nguyen (jnguyen)"

# Install nginx and openssl
RUN apt -qq update -y && \
	apt -qq install -y nginx openssl

# Clean up
RUN rm -rf /etc/nginx/sites-enabled/default && \
	rm -rf /etc/nginx/sites-available/default

# Generate SSL certificate
RUN openssl req -x509 -sha256 -nodes -days 365 -newkey rsa:2048 \
	-keyout /etc/ssl/private/inception.key -out /etc/ssl/certs/inception.crt \
	-subj "/C=FR/ST=IDF/L=Paris/O=42/OU=DevOps/CN=localhost/"

# Copy configuration
COPY ./jnguyen.42.fr /etc/nginx/sites-available/jnguyen.42.fr

# Enable site
RUN ln -s /etc/nginx/sites-available/jnguyen.42.fr /etc/nginx/sites-enabled/jnguyen.42.fr

# Run nginx
CMD ["nginx", "-g", "daemon off;"]
