FROM --platform=linux/amd64 mysql:debian

# Set environment variables for the MySQL database
ENV MYSQL_DATABASE=AppDB
ENV MYSQL_USER=appuser
ENV MYSQL_PASSWORD=apppassword
ENV MYSQL_ROOT_PASSWORD=rootpassword

# Copy the SQL script into the image
COPY dummy-data.sql /docker-entrypoint-initdb.d/

# Grant all necessary permissions to the user and flush privileges
RUN chmod 777 /docker-entrypoint-initdb.d/dummy-data.sql

USER 12010

CMD ["mysqld"]