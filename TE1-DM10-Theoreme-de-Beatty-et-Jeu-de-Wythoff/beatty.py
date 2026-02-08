import math
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
    p = 0
    cas = 0 # 0 pour pas fini, 1 pour u = a(p), 2 pour u = b(p)
    while cas == 0:
        p += 1
        if u == a(p):
            cas = 1
        elif u  == b(p):
            cas = 2

    if cas == 2:
        return (u, a(p))

    if cas == 1:
        if v > u + p:
            return (u, b(p))
        else:
            return (a(v-u), b(v-u))