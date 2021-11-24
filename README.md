# ER20 Smart Contract for Contra Coin

## Development

In order to start a development environment for working on Contra Coin follow these steps:

1. Install truffle as a global dependency by running `npm i truffle -g`
2. Install Ganache visual interface by going to [this link](https://www.trufflesuite.com/ganache)
3. Start an instance of Ganache and setup an Ethereum workspace.
4. In the project's repository run:

- `truffle compile`
- `truffle migrate`

The Smart Contract should be now deployed in your Ganache private blockchain.

To interact with the contract you can use truffle's console by running `truffle console` in your terminal.

For more information about interacting with a Smart Contract in Ganache, check [these docs](https://www.trufflesuite.com/docs/truffle/getting-started/interacting-with-your-contracts).

## Deployment

To deploy this Smart Contract to your favorite Ethereum network, update truffe-config.js with the appropiate parameters required for the target network. After that, run: `truffle migrate --network name-of-target-network` to deploy the Smart Contract.

## Guides

- [Open Zeppelin ERC20 Token Spec](https://docs.openzeppelin.com/contracts/4.x/erc20)
- [Truffle Docs](https://www.trufflesuite.com/docs)
- [Open Zeppelin Docs](https://docs.openzeppelin.com)
