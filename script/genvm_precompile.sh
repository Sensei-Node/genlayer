#!/bin/bash
echo "precompiling genvm ... "

cd /genlayer/genlayer-node-linux-amd64

echo "00"
if [ ! -f ./configs/node/wallet.yaml ]; then
  echo "11"
  if [ "$GENVM_PRECOPMILE" = "true" ]; then
    echo "22"
    echo "precompile enable $GENVM_PRECOPMILE" 
    ./third_party/genvm/bin/genvm precompile
  fi
fi

cd -
