import math
from itertools import count

phi = (1 + math.sqrt(5))/2
a = lambda p: math.floor(p * phi)
b = lambda p: math.floor(p * phi * phi)

def is_beatty(u,v):
    p = abs(u - v)
    return min(u,v) == a(p)

def coup_gagnant(u,v):
    u,v = min(u,v), max(u,v) # On ordonne u et v

    # On est en situation perdante
    if is_beatty(u,v):
        return (u - 1, v - 1)
    
    # On détermine si u = a(p) ou u = b(p)
    for p in count(start= 1):
        if u == a(p):
            if v > u + p:
                return (u, b(p))
            else:
                return (a(v-u), b(v-u))
        elif u == b(p):
            return (u, a(p))