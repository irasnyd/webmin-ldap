Introduction
============

This is a containerized version of Webmin, developed specifically to provide a
web interface to manage LDAP users and groups. No other server management
features are exposed to the users. It is designed to be used as a frontend so
that non-administrator users can add and remove LDAP users and groups without
knowing all the intricacies of LDAP itself.

The container is designed to be completely stateless. You *should not* need to
save any of the files from within the container to maintain the desired
functionality.

An example `docker-compose.yml` is provided for easy startup.

Environment Variables
=====================

This section describes all of the environment variables that can be used to
customize the behavior of this container. Please override them with values
specific to your configuration.

Users and Passwords
-------------------

- `WEBMIN_ROOT_PASSWORD` - The Webmin root password (default: "root")
- `WEBMIN_LDAP_ADMINISTRATORS` - The Webmin LDAP Administrator user/password combos (default: "admin1:password1,admin2:password2")
- `WEBMIN_SSL` - Enable or disable SSL mode in Webmin (default: "1")

LDAP Server Settings
--------------------

- `LDAP_URI` - LDAP Server URI (default: "ldap://ldap.example.com")
- `LDAP_BINDDN` - LDAP Bind DN (default: "cn=admin,dc=example,dc=com")
- `LDAP_BINDPW` - LDAP Bind Password (default: "password")
- `LDAP_BASE` - LDAP Base DN (default: "dc=example,dc=com")

Webmin ldap-useradmin Module Settings
-------------------------------------

- `LDAP_BASE_UID` - Starting user id for new users (default: "500")
- `LDAP_BASE_GID` - Starting group id for new groups (default: "500")
- `LDAP_DEFAULT_SHELL` - Default shell for new users (default: "/bin/sh")
- `LDAP_DEFAULT_GROUP` - Default group for new users (default: "ldapgroup")
- `LDAP_HOME_BASE` - Default base of home directories (default: "/home")
- `LDAP_USER_BASE` - Default organizational unit for users (default: "ou=Users,dc=example,dc=com")
- `LDAP_GROUP_BASE` - Default organizational unit for groups (default: "ou=Groups,dc=example,dc=com")
- `LDAP_SHELLS` - Set the shells that are available in the UI (default: "/bin/bash,/bin/tcsh,/bin/zsh")
