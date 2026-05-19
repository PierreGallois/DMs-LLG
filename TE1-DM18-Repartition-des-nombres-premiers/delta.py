def delta(n):
    return ppcm(n, delta(n - 1)) if n > 1 else 1
