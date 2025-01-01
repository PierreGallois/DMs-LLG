def couleur(a,b):
    c = 0
    while b != 0:
        q = a//b
        r = a%b

        c += q
        a = b
        b = r
        print(q)
    
    if c%2 == 0:
        print("La fraction est bleue")
    else:
        print("La fraction est rouge")

if __name__ == "__main__":
    couleur(235,68)