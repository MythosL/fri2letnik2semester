---
title: "APS2 Wiki – Kazalo"
tags: [aps2, index]
last_updated: 2026-04-16
---

# APS2 Wiki – Kazalo

Kompiliran učni pripomoček za predmet **Algoritmi in podatkovne strukture 2**.  
Vir: predavanja, vaje in domače naloge FRI.

---

## Teme (Topics)

| Tema | Ključni koncepti | Viri |
|---|---|---|
| [[APS2-Amortizirana_casovna_zahtevnost]] | Agregatna, bančniška, potencialna metoda | p3, v3, dn3 |
| [[APS2-Deli_in_vladaj]] | Master theorem, Merge sort, Karatsuba | p2, v2, DN2 |
| [[APS2-Dinamicno_programiranje]] | Memoizacija, LCS, Knapsack, Matrix chain | p5, v5, p6 |

---

## Koncepti (Concepts)

| Koncept | Opis |
|---|---|
| [[Potencialna_funkcija]] | Formalna osnova potencialne metode amortizacije |
| [[Divide_and_conquer]] | Paradigma deli in vladaj – splošno |
| [[Dinamicno_programiranje_osnove]] | Osnove DP: top-down vs bottom-up, načrtovanje |

---

## Struktura vaulta

```
wiki/
├── _index.md               ← to je ta datoteka
├── topics/
│   ├── APS2-Amortizirana_casovna_zahtevnost.md
│   ├── APS2-Deli_in_vladaj.md
│   └── APS2-Dinamicno_programiranje.md
└── concepts/
    ├── Potencialna_funkcija.md
    ├── Divide_and_conquer.md
    └── Dinamicno_programiranje_osnove.md
```

---

## Hitri pregled zahtevnosti

| Algoritem | Čas | Prostor |
|---|---|---|
| Merge sort | $O(n \log n)$ | $O(n)$ |
| Binarno iskanje | $O(\log n)$ | $O(1)$ |
| Karatsuba | $O(n^{1.585})$ | $O(n)$ |
| LCS | $O(mn)$ | $O(mn)$ |
| 0/1 Knapsack | $O(nW)$ | $O(nW)$ |
| Matrix chain | $O(n^3)$ | $O(n^2)$ |
| Push (dyn. array) | $O(1)$ amor. | — |
| Multipop (sklad) | $O(1)$ amor. | — |
| Binarni števec | $O(1)$ amor. | — |

---

## Naslednji koraki

> Dodaj ostale APS2 teme: Sprehod po grafih, Požrešni algoritmi, Maksimalni pretoki, Računska zahtevnost.
