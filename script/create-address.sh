#!/bin/bash
echo "creating account ..."

cd /genlayer/genlayer-node-linux-amd64

if [ ! -f ./configs/node/wallet.yaml ]; then
   ./bin/genlayernode account new -c $(pwd)/configs/node/config.yaml --setup --password "$PASSWORD"
fi
cd -
