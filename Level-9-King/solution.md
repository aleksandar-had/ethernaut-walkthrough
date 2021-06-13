# Level 9 - King

The attack contract must only be deployed for this challenge to be solved. Once the attack contract claims ***kingship***, any other contract or user that tries to transfer a greater amount will fail due to the ```receive()``` function in the attack contract calling ```revert()```.
