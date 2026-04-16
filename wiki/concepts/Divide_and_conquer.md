---
title: "Deli in vladaj (paradigma)"
tags: [aps2, deli-in-vladaj, paradigma, rekurzija]
sources: [p2.pdf]
last_updated: 2026-04-16
---

# Deli in vladaj – paradigma

## Splošna oblika

Vsak algoritem deli in vladaj sledi vzorcu:

```
Reši(problem P velikosti n):
  if n majhen: reši direktno
  razdeli P na a podproblemov velikosti n/b
  for vsak podproblem Pi:
    Reši(Pi)          # rekurzivno
  združi rešitve → rešitev P
```

Rekurzivna enačba: $T(n) = a \cdot T(n/b) + f(n)$

---

## Analiza z rekurzijskim drevesom

Za $T(n) = a \cdot T(n/b) + f(n)$:

- Globina drevesa: $\log_b n$
- Število listov: $a^{\log_b n} = n^{\log_b a}$
- Skupna cena listov: $\Theta(n^{\log_b a})$
- Skupna cena notranjih vozlišč: odvisna od $f(n)$

Dominira tisto, kar je večje.

---

## Izrek mojstrov

Glej [[APS2-Deli_in_vladaj#Izrek mojstrov (Master Theorem)]] za tabelo vseh 3 primerov.

**Omejitve izreka**: ne deluje za:
- $T(n) = 2T(n/2) + n/\log n$ (razlika ni polinomska)
- Nenavadne rekurence kot $T(n) = T(\sqrt{n}) + 1$

---

## Pogosti algoritmi

| Algoritem | Rekurenca | Zahtevnost |
|---|---|---|
| Merge sort | $2T(n/2) + n$ | $\Theta(n \log n)$ |
| Quick sort (avg) | $2T(n/2) + n$ | $\Theta(n \log n)$ |
| Binarno iskanje | $T(n/2) + 1$ | $\Theta(\log n)$ |
| Karatsuba | $3T(n/2) + n$ | $\Theta(n^{1.585})$ |
| Strassenovo množenje matrik | $7T(n/2) + n^2$ | $\Theta(n^{2.807})$ |
| Naivno množenje matrik | $8T(n/2) + n^2$ | $\Theta(n^3)$ |

---

## Primerjava z DP

| | Deli in vladaj | [[Dinamicno_programiranje_osnove\|Dinamično programiranje]] |
|---|---|---|
| Podproblemi | Neodvisni | Prekrivajoči se |
| Pristop | Rekurzija brez shranjevanja | Memoizacija ali tabelacija |
| Primer | Merge sort | Fibonacci, knapsack |

---

## Substitucijska metoda (`v2.pdf`)

1. Ugibaj obliko rešitve (npr. $T(n) = O(n \log n)$)
2. Dokaži z matematično indukcijo
3. Poišči konstanto $c$

**Primer**: $T(n) = 2T(n/2) + n$, predpostavi $T(n) \leq cn\log n$:
$$T(n) = 2 \cdot \frac{cn}{2}\log\frac{n}{2} + n = cn\log n - cn + n \leq cn\log n \text{ za } c \geq 1$$

---

## Povezave

- [[APS2-Deli_in_vladaj]] — konkretni algoritmi in primeri
- [[APS2-Dinamicno_programiranje]] — sorodna paradigma z DP
