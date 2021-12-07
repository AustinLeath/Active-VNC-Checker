# ACTIVE VNC CHECKER

## Meant to be ran on a host that will be connected to with VNC via port 5900

Features:

- checks if there is an active incoming TCP VNC connection via port 5900 with ESTABLISHED state
- if so, exits bash script.
- if not, starts a while loop that executes every 1 second that checks if idle time is greater than 30 seconds
- if idle time is greater than 30 seconds, will eventually execute a user sign out and exit the bash script.