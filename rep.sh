#!/bin/bash

echo "create role repmgr with superuser noinherit;ALTER ROLE repmgr WITH LOGIN;create database repmgr;GRANT ALL PRIVILEGES on DATABASE repmgr to repmgr;ALTER USER repmgr SET search_path TO repmgr_test, "$user", public;" | psql -p 5433
repmgr -f ~/data/repmgr.conf master register