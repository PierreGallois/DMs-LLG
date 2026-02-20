def u(n):
    if n == 0 or n == 1:
        return 1
    i = 1
    a, b = 1, 1
    while i < n:
        i += 1
        c = a**0.5 + b**0.5
        b, a = c, b
    return c

print(u(50)) # u_50 = 3.999999998476622