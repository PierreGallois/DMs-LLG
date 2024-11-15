# Calcule la somme des chiffres de n
def karma(n):
    d,p = n,0
    while d != 0:
        r = d%10
        d = d//10

        p += r**2
    
    return p

# Renvoie True si le nombre converge dans le puit 1, sinon False (tout nombre converge, voir partie 3)
def heureux(n):
    image = karma(n)
    while image != 1:
        # Teste si le nombre est arrivé dans la boucle
        # Ne teste qu'un valeur de la boucle, au prix peut-être d'un peu de performance
        if image == 4:
            return False
        image = karma(image)
    return True

# Compte la probabilite qu'un nombre inferieur à Nmax soit heureux
def probabilite(Nmax):
    return ([heureux(n) for n in range(1,Nmax+1)].count(True) / Nmax)



if __name__ == "__main__":
    print("a")

    print("aaaa")