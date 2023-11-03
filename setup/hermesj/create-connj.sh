#!/bin/bash
set -e

# Load shell variables
. ./network/hermesj/variables.sh

### Configure the clients and connection

echo "Initiating connection handshake juno and neutron..."
while ! $HERMES_BINARY --config $CONFIG_DIR create connection --a-chain neutron-test-1 --b-chain juno-test-3; do
  sleep 1
done

sleep 2
