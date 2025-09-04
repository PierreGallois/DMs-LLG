from math import sqrt


def u(n):
    if n == 0:
        return 5 / 2
    else:
        return (u(n-1) + (5 / u(n-1))) / 2
    
k = 0
while u(k) - sqrt(5) > 10**(-6):
    k += 1

print(k)