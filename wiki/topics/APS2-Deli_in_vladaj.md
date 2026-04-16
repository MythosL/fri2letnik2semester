---
title: "APS2 – Deli in vladaj"
tags: [aps2, deli-in-vladaj, rekurzija, sortiranje]
sources: [p2.pdf, v2.pdf, DN2.pdf]
last_updated: 2026-04-16
---

# Deli in vladaj (Divide and Conquer)

## Paradigma

Algoritem [[Divide_and_conquer|deli in vladaj]] rešuje problem rekurzivno v 3 korakih:
1. **Razdeli** problem na $a$ podproblemov velikosti $n/b$
2. **Reši** vsak podproblem rekurzivno
3. **Združi** rešitve

Časovna zahtevnost: $T(n) = a \cdot T(n/b) + f(n)$

---

## Izrek mojstrov (Master Theorem)

Za rekurenco $T(n) = a \cdot T(n/b) + f(n)$, kjer $a \geq 1$, $b > 1$:

Primerjamo $f(n)$ z $n^{\log_b a}$:

| Primer | Pogoj | Rezultat |
|---|---|---|
| 1 | $f(n) = O(n^{\log_b a - \varepsilon})$ | $T(n) = \Theta(n^{\log_b a})$ |
| 2 | $f(n) = \Theta(n^{\log_b a})$ | $T(n) = \Theta(n^{\log_b a} \log n)$ |
| 3 | $f(n) = \Omega(n^{\log_b a + \varepsilon})$ in regularnost | $T(n) = \Theta(f(n))$ |

> **Regularnostni pogoj** za primer 3: $a \cdot f(n/b) \leq c \cdot f(n)$ za $c < 1$.

---

## Algoritmi

### Merge Sort (`p2.pdf`)
- Razdeli: $a=2$, $b=2$, spoji: $f(n) = \Theta(n)$
- Master: $n^{\log_2 2} = n$, $f(n) = \Theta(n)$ → **Primer 2**
- $T(n) = \Theta(n \log n)$

```
MergeSort(A, l, r):
  if l < r:
    m = (l+r)/2
    MergeSort(A, l, m)
    MergeSort(A, m+1, r)
    Merge(A, l, m, r)   # O(n)
```

### Binarno iskanje (`p2.pdf`)
- $a=1$, $b=2$, $f(n) = O(1)$
- $n^{\log_2 1} = n^0 = 1$, $f(n) = \Theta(1)$ → **Primer 2**
- $T(n) = O(\log n)$

### Karatsubovo množenje (`p2.pdf`)
Množenje dveh $n$-bitnih števil $x, y$:

$$x = x_H \cdot 2^{n/2} + x_L, \quad y = y_H \cdot 2^{n/2} + y_L$$

Karatsubov trik – namesto 4 množitev samo 3:
$$z_0 = x_L y_L, \quad z_2 = x_H y_H$$
$$z_1 = (x_H + x_L)(y_H + y_L) - z_0 - z_2$$

- $T(n) = 3T(n/2) + O(n)$
- $n^{\log_2 3} \approx n^{1.585}$, $f(n) = O(n)$ → **Primer 1**
- $T(n) = \Theta(n^{\log_2 3}) \approx O(n^{1.585})$

---

## Rekurenčne enačbe iz vaj (`v2.pdf`, `DN2.pdf`)

Metode reševanja:
- **Substitucijska metoda**: ugibaj rešitev, dokaži z indukcijo
- **Rekurzijsko drevo**: vizualizacija ravni + cena na vsaki ravni
- **Master theorem**: direktna uporaba

**Primeri**:

| Rekurenca | Rešitev |
|---|---|
| $T(n) = 2T(n/2) + n$ | $\Theta(n \log n)$ |
| $T(n) = T(n-1) + n$ | $\Theta(n^2)$ |
| $T(n) = 2T(n/2) + n^2$ | $\Theta(n^2)$ |
| $T(n) = 4T(n/2) + n$ | $\Theta(n^2)$ |

---

## Povezave

- [[Divide_and_conquer]] — podrobnosti paradigme
- [[APS2-Amortizirana_casovna_zahtevnost]] — prva tema
- [[APS2-Dinamicno_programiranje]] — tretja tema
