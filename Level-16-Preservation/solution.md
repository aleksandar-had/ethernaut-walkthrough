# Level 16 - Preservation

After deploying the contract, you should think about how exactly to exploit the Preservation instance.
First of all, either ```setFirstTime()``` or ```setSecondTime()``` would do the trick. If we call ```setFirstTime()``` once with the exploit contract's address cast to uint as a parameter value, we effectively set the timeZone1Library address to the exploit contract's address. Then, a second call with our own address, would result in setting Preservation's owner address to our own address. Game over.

In the console after deploying LibraryContractAttacker:

```js
await contract.setFirstTime("LibraryContractAttacker's address cast to uint"); // wait for tx confirmation
await contract.setFirstTime("player's address cast to uint");
```
