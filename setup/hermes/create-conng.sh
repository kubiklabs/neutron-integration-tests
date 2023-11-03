#!/bin/bash
set -e

# Load shell variables
. ./network/hermes/variables.sh

### Configure the clients and connection
echo "Initiating connection handshake neutron and gaia..."
while ! $HERMES_BINARY --config $CONFIG_DIR create connection --a-chain neutron-test-1 --b-chain gaia-test-2; do
  sleep 1
done

sleep 2
