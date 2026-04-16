---
title: "APS2 – Dinamično programiranje"
tags: [aps2, dinamicno-programiranje, optimizacija, rekurzija]
sources: [p5.pdf, v5.pdf, p6.pdf]
last_updated: 2026-04-16
---

# Dinamično programiranje (DP)

## Kdaj uporabimo DP?

Problem ima:
1. **Prekrivajoče se podprobleme** (overlapping subproblems) — isti podproblemi se ponavljajo
2. **Optimalna podstruktura** (optimal substructure) — optimalna rešitev sestoji iz optimalnih rešitev podproblemov

> Razlika od [[Divide_and_conquer|deli in vladaj]]: pri DP se podproblemi prekrivajo in bi jih rekurzija večkrat reševala.

---

## Pristopi

### Memoizacija (top-down) (`p5.pdf`)
Rekurzivna implementacija + shranjevanje rezultatov:
```python
memo = {}
def fib(n):
    if n <= 1: return n
    if n in memo: return memo[n]
    memo[n] = fib(n-1) + fib(n-2)
    return memo[n]
```
- Rešuje samo potrebne podprobleme
- Overhead rekurzivnih klicev

### Tabelacija (bottom-up) (`p5.pdf`)
Iterativno gradi tabelo od najmanjših podproblemov:
```python
def fib(n):
    dp = [0] * (n+1)
    dp[1] = 1
    for i in range(2, n+1):
        dp[i] = dp[i-1] + dp[i-2]
    return dp[n]
```
- Brez rekurzije, boljša prostorska zahtevnost (lahko $O(1)$)

---

## Klasični problemi

### 0/1 Nahrbtnik (Knapsack) (`p5.pdf`)
- **Vhod**: $n$ predmetov, vsak ima težo $w_i$ in vrednost $v_i$; kapaciteta $W$
- **Izhod**: maksimalna vrednost pri $\sum w_i \leq W$

Rekurzija:
$$dp[i][w] = \max(dp[i-1][w],\ v_i + dp[i-1][w - w_i])$$

- Časovna zahtevnost: $O(nW)$
- Prostorska: $O(nW)$ ali $O(W)$ z optimizacijo

### Najdaljše skupno podzaporedje – LCS (`p6.pdf`)
- **Vhod**: niza $X = x_1 \ldots x_m$, $Y = y_1 \ldots y_n$
- **Izhod**: dolžina LCS

$$dp[i][j] = \begin{cases} dp[i-1][j-1] + 1 & \text{če } x_i = y_j \\ \max(dp[i-1][j],\ dp[i][j-1]) & \text{sicer} \end{cases}$$

- Zahtevnost: $O(mn)$ čas in prostor

### Množenje matrik (Matrix Chain Multiplication) (`p6.pdf`)
- **Vhod**: matrike $A_1, A_2, \ldots, A_n$ dimenzij $p_0 \times p_1, p_1 \times p_2, \ldots$
- **Izhod**: optimalno zaporedje množenj (min operacij)

$$dp[i][j] = \min_{i \leq k < j} \left( dp[i][k] + dp[k+1][j] + p_{i-1} \cdot p_k \cdot p_j \right)$$

- Zahtevnost: $O(n^3)$ čas, $O(n^2)$ prostor
- Vrstni red: diagonale tabele od manjših intervalov navzgor

---

## Splošna metodologija (`p5.pdf`, `p6.pdf`)

1. Definiraj **podproblem** (kaj shranimo v `dp[...]`)
2. Zapiši **rekurenco**
3. Določi **vrstni red** računanja
4. Prepoznaj **bazni primer**
5. Rekonstruiraj rešitev (backtracking po tabeli)

---

## Primeri iz vaj (`v5.pdf`)

- Najmanjše število kovancev za znesek $S$: $dp[s] = 1 + \min_{c \in \text{coins}} dp[s-c]$
- Najdaljše naraščajoče podzaporedje (LIS): $O(n^2)$ ali $O(n \log n)$
- Razbitje niza na besede iz slovarja

---

## Povezave

- [[Dinamicno_programiranje_osnove]] — konceptualni pregled
- [[Divide_and_conquer]] — sorodna paradigma
- [[APS2-Deli_in_vladaj]] — druga tema APS2
- [[APS2-Amortizirana_casovna_zahtevnost]] — prva tema APS2
