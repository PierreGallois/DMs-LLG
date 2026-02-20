def u(n):
    if n == 0 or n == 1:
        return 1
    i = 1
    a, b = 1, 1
    while i < n:
        i += 1
        c = 1/a + 1/b
        b, a = c, b
    return c

print(u(50)) # u_50 = 1.414213546982309