FROM postgres:latest
ENV POSTGRES_PASSWORD=secret
ENV POSTGRES_USER=mtuci
ENV POSTGRES_DB=mtuci
COPY migrations.sql /docker-entrypoint-initdb.d/migrations.sql
#RUN psql -U $POSTGRES_USER -d $POSTGRES_DB -a -f /docker-entrypoint-initdb.d/migrations.sql