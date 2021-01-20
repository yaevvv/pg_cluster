#!/bin/bash


#### Install PG
sudo yum update -y
sudo yum install -y postgresql postgresql-server postgresql-devel postgresql-contrib postgresql-docs

#### Initialize DB
sudo service postgresql initdb 

sed -i 's/127.0.0.1\/32 .*/0.0.0.0\/0 md5/' /var/lib/pgsql/data/pg_hba.conf
sed -i 's/^#port = 5432.*/port = 5432/' /var/lib/pgsql/data/postgresql.conf
sed -i "s/^#listen_addresses .*/listen_addresses='*'/" /var/lib/pgsql/data/postgresql.conf

#### Start DB
sudo service postgresql start


#### Install repmgr
sudo yum install repmgr11

