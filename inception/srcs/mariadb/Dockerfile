FROM debian:bullseye

LABEL author="Julien Nguyen (jnguyen)"

# Install MariaDB
RUN apt -qq update -y && \
    apt -qq install -y mariadb-server

# Configure MariaDB
RUN sed -i s/"127.0.0.1"/"*"/g /etc/mysql/mariadb.conf.d/50-server.cnf && \
    sed -i s/"socket ="/"#"/g /etc/mysql/mariadb.cnf

# Copy setup script
COPY ./setup.sh /setup.sh

# Run setup script
CMD ["/bin/bash", "/setup.sh"]
