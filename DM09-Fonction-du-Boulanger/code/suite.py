def f(x):
    if 0 <= x <= 1/2:
        return 2*x
    elif 1/2 < x <= 1:
        return 2*(1-x)

def suite(a, p):
    u = [a]
    for _ in range(p-1):
        u.append(f(u[-1]))
    return u