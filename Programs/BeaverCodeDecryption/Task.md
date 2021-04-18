Description
The encryption method is as follows:

The plaintext is divided into two halves, odd positions and even positions.

Example: 'CRYPTO' -> ['CYT','RPO']

This is then applied recursively to both halves, until each part is two letters or less. The parts are then merged.

'CRYPTO' -> ['CYT','RPO'] -> [['CT','Y'], ['RO','P']] -> 'CTYROP'

Challenge
Given a string encrypted with this method, decrypt it.