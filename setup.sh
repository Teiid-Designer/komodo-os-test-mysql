#!/bin/bash

###
#
# Installs and configures a mysql test database with 3 schemas and test data.
#
# Based on scripts from:
#
# * https://github.com/michaelepley/openshift-demo-jdv
# * https://github.com/cvanball/jdv-ose-demo
#
###

#################
#
# Show help and exit
#
#################
function show_help {
	echo "Usage: $0 -h"
	echo "-h - ip|hostname of Openshift host"
  exit 1
}

if [ ! -f 'config.sh' ]; then
    echo "No config file found .. exiting"
    exit 1
fi

#
# Source the configuration
#
. ./config.sh

#
# Determine the command line options
#
while getopts "h:" opt;
do
	case $opt in
	h) OS_HOST=$OPTARG ;;
	*) show_help ;;
	esac
done

if [ -z "$OS_HOST" ]; then
  echo "No Openshift host specified. Use -h <host|ip>"
  exit 1
fi

echo -e '\n\n=== logging into oc tool as openshift-dev ==='
oc login ${OS_HOST} -u ${OPENSHIFT_USER} -p ${OPENSHIFT_USER_PASSWD}

echo "Switch to the new project, creating it if necessary"
{ oc get project ${OPENSHIFT_PROJECT} 2>&1 >/dev/null && \
	oc project ${OPENSHIFT_PROJECT}; } || \
	oc new-project ${OPENSHIFT_PROJECT} || \
	{ echo "FAILED: Could not use indicated project ${OPENSHIFT_PROJECT}" && exit 1; }

echo -e '\n\n=== Deploying Custom Database template with values ==='
oc get dc/${OPENSHIFT_APPLICATION_NAME} 2>&1 >/dev/null || \
	oc new-app ${OS_TEMPLATE} \
		--param=APPLICATION_NAME=${OPENSHIFT_APPLICATION_NAME} \
        --param=DB_DATABASE=${DB_DATABASE} \
        --param=DB_USERNAME=${DB_USERNAME} \
        --param=DB_PASSWORD=${DB_PASSWORD} \
		-l app=${OPENSHIFT_APPLICATION_NAME}

echo "==============================================="
echo -e '\n\n=== Start the following build if not already started:'
echo -e '\n\n=== 	1. oc start-build ${OPENSHIFT_APPLICATION_NAME}'
echo "==============================================="

echo "Done."
