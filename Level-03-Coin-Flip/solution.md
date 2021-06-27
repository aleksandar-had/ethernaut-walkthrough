# Level 3 - Coin Flip

I opted for the exploit contract with the CoinFlip contract's ABI in the same [file](CoinAttack.sol).

Once deployed, try out the two different functions ```attackWithABI()``` and ```attackWithoutABI()``` to see that they both work. You can always check the number of consecutive guesses by querying the ```consecutiveWins``` state variable from Ethernaut's CoinFlip contract.

```js
await contract.consecutiveWins()
```
