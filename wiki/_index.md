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
| [[APS2-Sprehod_po_grafih]] | BFS, DFS, topološko urejanje, SCC | predavanje_sprehodi_po_grafih, vaje07 |
| [[APS2-Pozresni_algoritmi]] | Huffman, Kruskal, Prim, Dijkstra | p4, v4 |
| [[APS2-Racunska_zahtevnost]] | Asimptotična notacija (O, Θ, Ω, o, ω), Stirling, L'Hôpital | P1, V1, DN1 |
| [[APS2-Maksimalni_pretoki]] | Ford-Fulkerson, Edmonds-Karp, min-cut, ujemanje | maksimalni_pretoki, dosegljivost |

---

## Študijski vodiči (Guides)

Pedagoško strukturirani vodiči z intuicijo, pripodobami, preslikavami in nalogami:

| # | Vodič | Za snov |
|---|---|---|
| 01 | [[guide-01-Racunska_zahtevnost]] | Asimptotična notacija, Stirling, limite |
| 02 | [[guide-02-Deli_in_vladaj]] | Deli in vladaj, krovni izrek, Karatsuba |
| 03 | [[guide-03-Amortizirana_casovna_zahtevnost]] | Amortizirana analiza (agreg./računov./potencial) |

---

## Koncepti (Concepts)

| Koncept | Opis |
|---|---|
| [[Asimptoticna_notacija]] | Formalni pregled O, Θ, Ω, o, ω z dokaznimi tehnikami |
| [[Potencialna_funkcija]] | Formalna osnova potencialne metode amortizacije |
| [[Divide_and_conquer]] | Paradigma deli in vladaj – splošno |
| [[Dinamicno_programiranje_osnove]] | Osnove DP: top-down vs bottom-up, načrtovanje |
| [[Maksimalni_pretok]] | Teorija pretokov: max-flow min-cut, preostalo omrežje |

---

## Struktura vaulta

```
wiki/
├── _index.md               ← to je ta datoteka
├── topics/
│   ├── APS2-Amortizirana_casovna_zahtevnost.md
│   ├── APS2-Deli_in_vladaj.md
│   ├── APS2-Dinamicno_programiranje.md
│   ├── APS2-Sprehod_po_grafih.md
│   ├── APS2-Pozresni_algoritmi.md
│   ├── APS2-Racunska_zahtevnost.md
│   └── APS2-Maksimalni_pretoki.md
├── concepts/
│   ├── Asimptoticna_notacija.md
│   ├── Potencialna_funkcija.md
│   ├── Divide_and_conquer.md
│   ├── Dinamicno_programiranje_osnove.md
│   └── Maksimalni_pretok.md
└── guides/
    ├── guide-01-Racunska_zahtevnost.md
    ├── guide-02-Deli_in_vladaj.md
    └── guide-03-Amortizirana_casovna_zahtevnost.md
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
| BFS | $O(V+E)$ | $O(V)$ |
| DFS | $O(V+E)$ | $O(V)$ |
| Topološko urejanje | $O(V+E)$ | $O(V)$ |
| Kosaraju (SCC) | $O(V+E)$ | $O(V)$ |
| Dijkstra | $O(E \log V)$ | $O(V)$ |
| Prim (MST) | $O(E \log V)$ | $O(V)$ |
| Kruskal (MST) | $O(E \log E)$ | $O(V)$ |
| Huffman | $O(n \log n)$ | $O(n)$ |
| Ford-Fulkerson | $O(E \cdot \|f^*\|)$ | $O(V+E)$ |
| Edmonds-Karp | $O(VE^2)$ | $O(V+E)$ |
