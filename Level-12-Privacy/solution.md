# Level 12 - Privacy

Find the value of ```data[2]``` in the contract's storage via ```web3.eth.getStorageAt()```

In the console:

```js
const key = await web3.eth.getStorageAt(instance, 5)
await contract.unlock(key)
```
