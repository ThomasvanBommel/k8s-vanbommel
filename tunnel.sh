#!/bin/bash

# Usage: tunnel.sh
#
# Creates ssh tunnels for development to a
# remote server.

# dashboard tunnel
ssh -NL 30000:localhost:8001 192.168.1.169

# ingress tunnel
# ssh -NL 8080:192.168.49.2:80 192.168.1.169 &