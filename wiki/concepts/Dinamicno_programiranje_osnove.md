---
title: "Dinamično programiranje – osnove"
tags: [aps2, dinamicno-programiranje, paradigma, optimizacija]
sources: [p5.pdf, p6.pdf]
last_updated: 2026-04-16
---

# Dinamično programiranje – osnove

## Ključni pogoji

Problem je primeren za DP, če ima obe lastnosti:

### 1. Prekrivajoči se podproblemi
Rekurzivni algoritem rešuje **iste podprobleme večkrat**.

Primer – Fibonacci brez DP:
```
fib(5)
├── fib(4) ── fib(3) ── fib(2)
│            └── fib(2)     <-- ponovitev!
└── fib(3) ── fib(2)        <-- ponovitev!
```
Eksponentna zahtevnost → z memoizacijo $O(n)$.

### 2. Optimalna podstruktura
**Optimalna rešitev** problema vsebuje **optimalne rešitve** podproblemov.

Protiprimer: najdaljša pot v grafu s cikli (ne velja).

---

## Top-down vs Bottom-up

```
                 ┌─────────────┐
   Rekurzija  →  │ TOP-DOWN    │  = Memoizacija
                 │ (z memo[])  │
                 └─────────────┘
                       vs
                 ┌─────────────┐
   Iteracija  →  │ BOTTOM-UP   │  = Tabelacija
                 │ (dp tabela) │
                 └─────────────┘
```

| | Memoizacija | Tabelacija |
|---|---|---|
| Smer | od vrha navzdol | od dna navzgor |
| Implementacija | rekurzija + slovar | zanke + array |
| Podproblemi | samo potrebni | vsi |
| Prostorska | klic stack + memo | samo tabela |

---

## Načrtovanje DP algoritma (`p5.pdf`)

**5 korakov:**
1. **Definiraj podproblem**: kaj pomeni `dp[i]`, `dp[i][j]`?
2. **Zapiši rekurenco**: kako izračunamo `dp[i]` iz manjših?
3. **Vrstni red**: zagotovi da so `dp[j]` za $j < i$ že izračunani
4. **Bazni primeri**: vrednosti brez rekurzije
5. **Rekonstrukcija**: po tabeli nazaj za dejanski izhod

---

## Tipični vzorci podproblemov

| Tip | `dp[i]` pomeni | Primer |
|---|---|---|
| 1D niz | rešitev za prvih $i$ elementov | LIS, kovanci |
| 2D niz×niz | rešitev za $X[1..i]$, $Y[1..j]$ | LCS, edit distance |
| 2D interval | rešitev za $A[i..j]$ | matrix chain, palindromi |
| Podmnožice | rešitev za podmnožico $S$ | TSP, subset sum |

---

## Rekonstrukcija rešitve

Poleg vrednosti `dp[i][j]` shranjujemo **odločitve** (npr. `choice[i][j]`):

```python
# LCS rekonstrukcija
def reconstruct(choice, X, i, j):
    if i == 0 or j == 0: return ""
    if choice[i][j] == 'match':
        return reconstruct(choice, X, i-1, j-1) + X[i]
    elif choice[i][j] == 'up':
        return reconstruct(choice, X, i-1, j)
    else:
        return reconstruct(choice, X, i, j-1)
```

---

## Primerjava s pohlepnimi algoritmi

| | DP | Pohlepni |
|---|---|---|
| Zahtevnost | Višja (tabelacija) | Nižja |
| Optimalnost | Zagotovljena (če OS velja) | Ni zagotovljena (posebni primeri) |
| Pristop | Preizkusi vse možnosti | Lokalno optimalna odločitev |

---

## Povezave

- [[APS2-Dinamicno_programiranje]] — konkretni algoritmi (knapsack, LCS, matrix chain)
- [[Divide_and_conquer]] — sorodna paradigma brez prekrivajočih podproblemov
