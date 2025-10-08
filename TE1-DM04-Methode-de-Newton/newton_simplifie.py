
f = lambda x: x**3 - 2

def newton(f, x, h=1e-4, epsilon=1e-6):
    while abs(y := f(x)) > epsilon:
        derivee = (f(x + h) - f(x - h)) / (2 * h)
        x -= (y / derivee)
    return x

if __name__ == "__main__":
    print(newton(f, 1))