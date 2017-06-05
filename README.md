# Komodo Test Databases on Openshift

## Summary

Provides configuration setup for komodo test databases deployed as a single pod on Openshift

Clone the repository and execute the setup.sh script. This is turn loads the template, which configures an image of a Mysql database, containing schemas - 'usstates' and 'patients'.

Settings can be modified by editing the 'config.sh' script prior to executing 'setup.sh'.

## Environment Variables
* OPENSHIFT_USER - The developer user for Openshift
* OPENSHIFT_USER_PASSWD - The developer user password for Openshift
* OPENSHIFT_ADMIN - The administration user for Openshift
* OPENSHIFT_ADMIN_PASSWD - The administration user password for Openshift

* OPENSHIFT_PROJECT - The name of the Openshift project in which to add the database instance
* OPENSHIFT_APPLICATION_NAME - The name of the application service of the database instance

* DB_DATABASE - The database instance made accessible for the database user 
* DB_USERNAME - The database user who can access the specified database
* DB_PASSWORD - The database user's password
