def catalan(n):
    Ck = [1]

    # Calculs successifs des C_i pour tout 1 <= i <= n
    # Avec la formule du d)
    for i in range(1, n + 1):
        Ci = 0
        for j in range(i):
            Ci += Ck[j] * Ck[i - j - 1]

        Ck.append(Ci)

    return Ck[n]