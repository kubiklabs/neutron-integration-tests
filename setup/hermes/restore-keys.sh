#!/bin/bash
set -e

# Load shell variables
. ./network/hermes/variables.sh

### Sleep is needed otherwise the relayer crashes when trying to init
sleep 1

### Restore Keys
$HERMES_BINARY --config $CONFIG_DIR keys add --key-name testkey_1 --chain test-1 --mnemonic-file <(echo "alley afraid soup fall idea toss can goose become valve initial strong forward bright dish figure check leopard decide warfare hub unusual join cart")
sleep 5

$HERMES_BINARY --config $CONFIG_DIR keys add --key-name testkey_2 --chain test-2 --mnemonic-file <(echo "record gift you once hip style during joke field prize dust unique length more pencil transfer quit train device arrive energy sort steak upset")
sleep 5

$HERMES_BINARY --config $CONFIG_DIR keys add --key-name testkey_3 --chain test-3 --mnemonic-file <(echo "black frequent sponsor nice claim rally hunt suit parent size stumble expire forest avocado mistake agree trend witness lounge shiver image smoke stool chicken")
sleep 5
