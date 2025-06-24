#!/bin/bash
echo "running the node ..."
apt update && apt install wget -y && wget https://github.com/mikefarah/yq/releases/latest/download/yq_linux_amd64 -O /usr/bin/yq && chmod +x /usr/bin/yq

wget https://storage.googleapis.com/gh-af/genlayer-node/bin/amd64/${TEST_VERSION}/genlayer-node-linux-amd64-${TEST_VERSION}.tar.gz -O - |
tar -xzvf - 

/genlayer/script/genvm_precompile.sh

/genlayer/script/create-address.sh

cd genlayer-node-linux-amd64

yq e ".rollup.zksyncurl = \"$ZKSYNC_URL\"" -i /genlayer/genlayer-node-linux-amd64/configs/node/config.yaml
yq e ".rollup.zksyncwebsocketurl = \"$ZKSYNC_URL_WS\"" -i /genlayer/genlayer-node-linux-amd64/configs/node/config.yaml

sed -i 's|webdriver_host: http://127.0.0.1:4444|webdriver_host: http://webdriver-container:4444|' /genlayer/genlayer-node-linux-amd64/third_party/genvm/config/genvm-module-web.yaml

./bin/genlayernode run -c $(pwd)/configs/node/config.yaml --password "$PASSWORD" | tee /genlayer/script/genlayer.log 

