FROM postgres:9.6

RUN apt-get update -y
RUN apt-get install wget libglib2.0-0  -y

RUN touch /etc/apt/sources.list.d/pgdg.list
RUN echo "deb http://apt.postgresql.org/pub/repos/apt/ jessie-pgdg main" > /etc/apt/sources.list.d/pgdg.list; \
    wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add -; \
    apt-get update -y; \
    wget http://ftp.ru.debian.org/debian/pool/main/p/pkg-config/pkg-config_0.28-1_amd64.deb; \
    dpkg -i pkg-config_0.28-1_amd64.deb; \
    apt-get -f install postgresql-9.6-repmgr libevent-dev -y

RUN update-rc.d postgresql disable; \
    apt-get install openssh-server rsync -y

# prepare folders for ssh
RUN mkdir -p /var/lib/postgresql/.ssh
RUN touch /var/run/sshd.pid
RUN chown -R postgres:postgres /var/lib/postgresql/.ssh /var/run/sshd.pid
RUN chmod 700 /var/lib/postgresql/.ssh

EXPOSE 5432
EXPOSE 5433
    
CMD ["postgres"]