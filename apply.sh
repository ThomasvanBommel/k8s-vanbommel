#!/bin/bash

# Usage: apply.sh [create|delete|apply]
#
# Concatenates .yaml files and pipes the output
# to `minikube kubectl --` command to a remote
# server using ssh.
#
# $1: kubectl verb (default: apply)
#      - create: creates new resources
#      - delete: removes existing resources
#      - apply:  apply changes to configuration

CONFIG=""
CMD="${1:-apply}"

# foreach .yaml file in the current directory
# concatenate its contents to $CONFIG
for file in ./*.yaml; do
    CONFIG="${CONFIG}\n---\n$(cat $file)"
done

# apply configuration remotely using ssh
printf "$CONFIG" | ssh thomas@192.168.1.169 minikube kubectl -- $CMD -f -