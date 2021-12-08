# ACTIVE VNC CHECKER

## Meant to be ran on a host that will be connected to with VNC via port 5900 (such as guacamole MacOSX hosts)

Features:

- checks if there is an active incoming TCP VNC connection via port 5900 with ESTABLISHED state
- if so, continues until TCP VNC connection is not active and in the ESTABLISHED state
- if VNC connection is not active for more than 30 seconds, will eventually execute a user sign out and exit the bash script

Needs:

- still needs to execute user sign out