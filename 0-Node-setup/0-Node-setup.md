# Gitcoin 0 - Setup a Local CKB Node and CKB Indexer for the Testnet

https://gitcoin.co/issue/nervosnetwork/grants/1/100026176

# Prerequisites

```bash
sudo apt install build-essential git curl p7zip-full python2
nvm use 14
npm i -g yarn
# Docker : https://docs.docker.com/get-docker/
```

# 1. Setup a CKB Node

What is a `CKB Node` : https://github.com/Kuzirashi/gw-gitcoin-instruction/blob/master/src/conceptual-explainers/tooling.md#ckb-node

Binaries : https://github.com/nervosnetwork/ckb/releases/tag/v0.43.1

```bash
curl -LO https://github.com/nervosnetwork/ckb/releases/download/v0.43.1/ckb_v0.43.1_x86_64-unknown-linux-gnu.tar.gz
tar xzf ckb_v0.43.1_x86_64-unknown-linux-gnu.tar.gz
mv ckb_v0.43.1_x86_64-unknown-linux-gnu ckb_v0.43.1
echo 'export PATH=$PATH:~/Nervos-Hackaton/ckb_v0.43.1' >> ~/.bashrc
```

```bash
# Initialize the node to the testnet before syncing
ckb init --chain testnet

# Start syncing from scratch
ckb run

# Or restore a snapshot
# See : https://ckb.tools/bootstrap
cd Nervos-Hackaton/ckb_v0.43.1 && curl -sSf https://raw.githubusercontent.com/Kuzirashi/gw-gitcoin-instruction/master/scripts/install_ckb_node_snapshot_data.sh | sh
# It will download a compressed file containing a snapshot of the blockchain and put it in the right folders

# Finish the syncing
ckb run
```

## Snapshot

![CKB Node](images/ckb_node.jpg)

# 2. Setup a CKB Indexer



## Snapshot

![CKB Indexer](images/ckb_indexer.jpg)