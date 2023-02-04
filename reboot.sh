#!/usr/bin/env bash

echo -e "\033[34m-------------wsgi process-------------\833[0m"
ps -ef | grep school_office_uwsgi.ini | grep -v grep
sleep 0.5
echo -e '\n-------------going to close-----------'
ps -ef | grep school_office_uwsgi.ini | grep -v grep | awk '{print $2}' | xargs kill -9
sleep 0.5
echo -e '\n--------------check if the kill action is correct--------'

/envs/school-office/bin/uwsgi --ini school_office_uwsgi.ini &
# shellcheck disable=SC2188
>/dev/null

echo -e '\n\033[42;1m---------start--------------\033[0m'

sleep 1
ps -ef | grep school_office_uwsgi.ini | grep -v grep
