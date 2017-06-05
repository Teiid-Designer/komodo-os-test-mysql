#!/bin/bash

# OS settings
OS_TEMPLATE='komodo-test-mysql.json'

## Default credentials for minishift
OPENSHIFT_USER=developer
OPENSHIFT_USER_PASSWD=developer
OPENSHIFT_ADMIN=system
OPENSHIFT_ADMIN_PASSWD=admin

OPENSHIFT_PROJECT=ds1
OPENSHIFT_APPLICATION_NAME=komodo-test-mysql

# Mysql Database instance
DB_DATABASE=usstates
DB_USERNAME=admin
DB_PASSWORD=admin
