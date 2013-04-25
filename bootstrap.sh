#!/usr/bin/env bash

###MAKE SURE THE CURRENT USER IS ROOT###
if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root" 1>&2
   exit 1
fi

aptitude update;
aptitude install -y nginx php5-cli php5-curl php5-sqlite php5-mysql php5 php5-fpm mysql-server curl;
