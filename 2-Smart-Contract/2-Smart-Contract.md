# Gitcoin: 2 - Deploy a Simple Ethereum Smart Contract on Polyjuice

https://gitcoin.co/issue/nervosnetwork/grants/3/100026209

## Prerequisites

### 1. Prepare Your Ethereum Private Key

My Ethereum private key : `0xcde930b2d7425acd30909d7a89c89978921da051b1855d5f6a7b13ad44c970b2` which has funds on layer 2 so it can pay the gas fees.

### 2. Clone and Setup the Gitcoin Task Instruction Examples

```bash
git clone https://github.com/kuzirashi/gw-gitcoin-instruction && cd gw-gitcoin-instruction
yarn install-all
```

### 3. Compile the Smart Contract and Copy the Artifact

Smart contract used :
```solidity
pragma solidity >=0.8.0;

contract SimpleCalculator {
  uint x;

  function setX(uint n) public payable {
    x = n;
  }
  
  function pow() public view returns (uint) {
      return x * x;
  }
}
```

```bash
cd ~/Nervos-Hackaton/gw-gitcoin-instruction/src/examples/2-deploy-contract/
# Deposit SimpleCalculator.sol in contracts folder before compiling

# Will compile the smart contract using ethereum/solc:0.8.3 Docker image
yarn compile

# The compiler has generated SimpleCalculator.json file in the build/ folder
```

### 4. Deploy a Smart Contract Using Web3.js

Let's replace my private key `<YOUR_ETHEREUM_PRIVATE_KEY>` in `index.js` file which is the deployment script, and execute it :
```bash
node index.js SimpleCalculator.json
```

Deployment successfull :
```
Found file: ./build/contracts/SimpleCalculator.json
Deploying contract...
Transaction hash: 0x5dea9aca2b1486ffe117fd0295e10179665d18b5164c5c634c085da21a981677
Deployed contract address: 0x17E7B5e5280bC6E090E4E505A3223e6069A7A2C8
```

![Contract Deployment](images/contract_deployment.png)
