from math import sqrt

def f(b: int) -> float:
    return sqrt(1 + 5 * b**2)

def test_to(n: int):
    for b in range(1, n+1):
        a = f(b)
        if a.is_integer():
            yield a, b

if __name__ == "__main__":
    for e in test_to(200000000000000):
        print(e)