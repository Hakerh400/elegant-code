Given a list of strings(and optionally, their length) as input, weave the strings together.

Your goal is to mimic the WV operator in Pip. Take a list of strings and alternate between their characters like so:

hello,
world, → hwc,eoo,lrd,lle,od → hwceoolrdlleod
code
Effectively, you need to group the characters at each index, and join them into a single string.

The strings may have spaces.

No truncation should be done, and all the characters of each string must be used.