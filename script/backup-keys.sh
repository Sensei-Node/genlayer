#!/bin/bash

source .env
cd /genlayer/genlayer-node-linux-amd64
echo "backup the keys ... "
mkdir -p $(pwd)/secure/
if [ -f ./configs/node/wallet.yaml ]; then
   ./bin/genlayernode account export \
   --password "$PASSWORD" \
   --address "$VALIDATOR_ADDRESS" \
   --passphrase "$BACKUP_ENCRYPTION_PASSPHRASE" \
   --path "$(pwd)/secure/" \
   -c $(pwd)/configs/node/config.yaml
fi
cd -
