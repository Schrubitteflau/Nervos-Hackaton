# Gitcoin: 3 - Issue a Smart Contract Call to the Deployed Smart Contract

https://gitcoin.co/issue/nervosnetwork/grants/4/100026210

## 1. Prepare the Smart Contract Address and ABI

ABI of `SimpleCalculator` contract (in `gw-gitcoin-instruction/src/examples/2-deploy-contract/build/contracts/SimpleCalculator.json`) :
```json
[
  {
    "inputs": [
      {
        "internalType": "uint256",
        "name": "n",
        "type": "uint256"
      }
    ],
    "name": "setX",
    "outputs": [],
    "stateMutability": "payable",
    "type": "function"
  },
  {
    "inputs": [],
    "name": "pow",
    "outputs": [
      {
        "internalType": "uint256",
        "name": "",
        "type": "uint256"
      }
    ],
    "stateMutability": "view",
    "type": "function"
  }
]
```

`SimpleCalculator` previously deployed contract address : `0x17E7B5e5280bC6E090E4E505A3223e6069A7A2C8`

## 2. Prepare and Run the Example Code to Call the Smart Contract

In `gw-gitcoin-instruction/src/examples/3-call-contract/index.js`, replace the values :
```
<YOUR_ETHEREUM_PRIVATE_KEY> # Ethereum private key for layer 2
<YOUR_CONTRACT_ABI>
<YOUR_CONTRACT_ADDRESS>
CONTRACT_ADDRESS variable value
YOUR_READ_FUNCTION_NAME method name
YOUR_WRITE_FUNCTION_NAME method name
```

Calls :
```js
async function readCall() {
    const contract = new web3.eth.Contract(CONTRACT_ABI, CONTRACT_ADDRESS);

    const callResult = await contract.methods.pow().call({
        from: account.address
    });

    console.log(`pow() Read call result: ${callResult}`);
}

async function writeCall() {
    const contract = new web3.eth.Contract(CONTRACT_ABI, CONTRACT_ADDRESS);

    const tx = contract.methods.setX(4).send(
        {
            from: account.address,
            to: '0x' + new Array(40).fill(0).join(''),
            gas: 6000000,
            gasPrice: '0',
        }
    );
    tx.on('transactionHash', hash => console.log(`setX(4) Write call transaction hash: ${hash}`));
    const receipt = await tx;
    console.log('Write call transaction receipt: ', receipt);
}
```

Run the script :
```bash
cd ~/Nervos-Hackaton/gw-gitcoin-instruction/src/examples/3-call-contract
node index.js
```

Result of smart contract call :
![Smart contract call](images/contract_call.png)

Output :
```
Calling contract...
pow() Read call result: 0
setX(4) Write call transaction hash: 0xc6fcd31087743c0b6760c48735a5b865c1cb6c48db634932fc2d270459c1c5e5
Write call transaction receipt:  {
  transactionHash: '0xc6fcd31087743c0b6760c48735a5b865c1cb6c48db634932fc2d270459c1c5e5',
  blockHash: '0x8b3e03fa0058d4474593dc46f5b983853b2cec72e7351a898c257ba8d5a683de',
  blockNumber: 20578,
  transactionIndex: 0,
  gasUsed: 20374,
  cumulativeGasUsed: 20374,
  logsBloom: '0x00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000',
  contractAddress: null,
  status: true,
  events: {}
}
pow() Read call result: 16
```
