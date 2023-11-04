#!/bin/bash
set -e

# Load shell variables
. ./network/hermes/variables.sh

### Sleep is needed otherwise the relayer crashes when trying to init
sleep 1

### Restore Keys
$HERMES_BINARY --config ./network/hermes/config.toml keys add --key-name testkey_1 --chain neutron-test-1 --mnemonic-file <(echo "alley afraid soup fall idea toss can goose become valve initial strong forward bright dish figure check leopard decide warfare hub unusual join cart")
sleep 5

$HERMES_BINARY --config ./network/hermes/config.toml keys add --key-name testkey_2 --chain neutron-test-1 --mnemonic-file <(echo "black frequent sponsor nice claim rally hunt suit parent size stumble expire forest avocado mistake agree trend witness lounge shiver image smoke stool chicken")
sleep 5

$HERMES_BINARY --config ./network/hermes/config.toml keys add --key-name testkey_3 --chain gaia-test-2 --mnemonic-file <(echo "record gift you once hip style during joke field prize dust unique length more pencil transfer quit train device arrive energy sort steak upset")
sleep 5

$HERMES_BINARY --config ./network/hermes/config.toml keys add --key-name testkey_4 --chain juno-test-3 --mnemonic-file <(echo "click help knock drastic tourist cancel mom winner sort keen poem cross book lady front coin steel chef color few just hockey cable diamond")
sleep 5
