
f = lambda x: x**3 - 2

def newton(f, x0, epsilon=1e-6):
    h = 1e-4
    x = x0
    while abs(f(x)) > espilon:
        derivee = (f(x + h) - f(x - h)) / (2 * h)
        x = x - (f(x) / derivee)
    return x
