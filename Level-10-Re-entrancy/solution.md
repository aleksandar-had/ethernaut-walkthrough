# Level 10 - Re-entrancy

The focus point of this challenge is what could happen if re-entrancy isn't prevented. The attack contract makes use of the fact that the prevention measures are taken post- and not pre-transaction via the ```withdraw()``` function, thus enabling a malicious user to call it multiple times and effectively claim the whole contract's balance.

After deploying the attack contract, a user only has to call the ```attackWithdraw()``` function with sufficient gas to empty out the challenge's contract.