#!/bin/bash

CONFIG="/cardano-submit-api/configuration/submit-api-config.json"
SOCKETPATH="/node/ipc/node.socket"

cardano-submit-api --config ${CONFIG} --socket-path ${SOCKETPATH} --listen-address 0.0.0.0 --port 8090 --metrics-port 8080 --mainnet