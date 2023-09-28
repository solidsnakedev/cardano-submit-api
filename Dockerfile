FROM ubuntu:latest

# Install Cardano dependencies
RUN apt-get update -y && \
    apt-get install automake build-essential pkg-config git wget curl vim -y

RUN mkdir src

RUN TAG=$(curl -s https://api.github.com/repos/input-output-hk/cardano-node/releases/latest | jq -r .tag_name) && \
    cd src && \
    wget -cO - https://github.com/input-output-hk/cardano-node/releases/download/${TAG}/cardano-node-${TAG}-linux.tar.gz > cardano-node.tar.gz && \
    tar -xvf cardano-node.tar.gz && \
    mv cardano-submit-api /usr/local/bin

# Delete src folder
RUN rm -r /src

RUN wget -P /cardano-submit-api/configuration \
    https://raw.githubusercontent.com/input-output-hk/cardano-world/master/docs/environments/mainnet/submit-api-config.json

RUN mkdir -p /node/ipc

# Copy scripts
COPY ./run-cardano-submit-api.sh /usr/local/bin

# Set executable permits
RUN /bin/bash -c "chmod +x /usr/local/bin/*.sh"

# Run cardano-submit-api at the startup
CMD [ "/usr/local/bin/run-cardano-submit-api.sh" ]