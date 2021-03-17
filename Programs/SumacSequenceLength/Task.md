A Sumac sequence starts with two non-zero integers `t_1` and `t_2`.

The next term, `t_3 = t_1 - t_2`
More generally, `t_n = t_{n-2} - t_{n-1}`

The sequence ends when `t_n <= 0`. All values in the sequence must be positive.

Given two integers `t_1` and `t_2`, compute the Sumac sequence, and output it's length.

If there is a negative number in the input, remove everything after it, and compute the length.