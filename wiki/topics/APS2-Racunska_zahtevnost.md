---
title: "APS2 – Računska zahtevnost"
tags: [aps2, zahtevnost, np-polnost, redukcije, p-vs-np]
sources: [P1.pdf, V1.pdf]
last_updated: 2026-04-16
---

# Računska zahtevnost

## Odločitveni vs optimizacijski problemi

- **Odločitveni problem**: odgovor je DA/NE (npr. "Ali obstaja pot dolžine ≤ k?")
- **Optimizacijski problem**: iščemo najboljšo rešitev (npr. "Najdi najkrajšo pot")

> Vsak optimizacijski problem se da preoblikovati v odločitveni — analiza zahtevnosti se dela na odločitvenih.

---

## Razred P

$$P = \{ L \mid \exists \text{ deterministični TM, ki reši } L \text{ v polinomskem času} \}$$

Problemi rešljivi v $O(n^k)$ za neko konstanto $k$. Primeri: urejanje, BFS, DFS, MST, kratke poti.

---

## Razred NP

$$NP = \{ L \mid \exists \text{ nedeterministični TM, ki reši } L \text{ v polinomskem času} \}$$

**Ekvivalentno**: problemi, katerih rešitev se da **preveriti** v polinomskem času z danim certifikatom.

Primeri: TSP, SAT, Hamiltonov cikel, Barvanje grafa.

---

## Polinomska redukcija

$$A \leq_p B \quad \Leftrightarrow \quad \exists f \text{ izračunljiva v polinomskem času}: x \in A \iff f(x) \in B$$

**Pomen**: če znamo rešiti $B$, znamo rešiti $A$ (s pretvorbo vhoda).  
**Tranzitivnost**: $A \leq_p B$ in $B \leq_p C$ $\Rightarrow$ $A \leq_p C$

---

## NP-polnost

Problem $B$ je **NP-poln**, če:
1. $B \in NP$
2. $\forall A \in NP: A \leq_p B$ (B je NP-težak)

**Cook-Levinov izrek**: **SAT** je NP-poln (vsak NP problem se reducira na SAT).

### Dokazovanje NP-polnosti

1. Pokaži $B \in NP$ (preveri certifikat v polinomskem času)
2. Izberi znan NP-poln problem $A$
3. Konstruiraj polinomsko redukcijo $A \leq_p B$

---

## Ključni NP-polni problemi

| Problem | Opis |
|---|---|
| **SAT** | Ali je logična formula v KNF zadovoljiva? |
| **3-SAT** | SAT z vsako klavzulo natanko 3 literali |
| **Vertex Cover** | Ali obstaja pokritje vozlišč velikosti $\leq k$? |
| **Clique** | Ali obstaja klik velikosti $\geq k$? |
| **Independent Set** | Ali obstaja neodvisna množica velikosti $\geq k$? |
| **Subset Sum** | Ali obstaja podmnožica z vsoto natanko $T$? |
| **Hamiltonov cikel** | Ali obstaja Hamiltonov cikel? |
| **TSP** | Ali obstaja tura dolžine $\leq k$? |

---

## Hierarhija razredov

```
P ⊆ NP ∩ co-NP
        NP
       /    \
  P         co-NP
       \    /
       NP-polni
```

- **co-NP**: komplementi NP problemov
- **NP-težak**: vsaj tako težek kot vsi NP problemi, ni nujno v NP
- **P = NP?**: odprto vprašanje (najverjetneje P ≠ NP)

---

## Reševanje NP-polnih problemov v praksi

| Pristop | Opis |
|---|---|
| Aproksimacijski algoritmi | jamčijo rešitev znotraj faktorja od optimuma |
| Parametrizirana zahtevnost | polinomski v $n$, eksponentni le v parametru $k$ |
| Hevristike | dobre rešitve brez jamstev (SA, GA) |
| Posebni primeri | nekateri NP-polni problemi so na posebnih grafih v P |

---

## Povezave

- [[NP_polnost]] — formalni pregled NP-polnosti in redukcij
- [[APS2-Dinamicno_programiranje]] — DP rešuje nekatere NP-težke probleme pseudo-polinomsko
- [[APS2-Pozresni_algoritmi]] — pohlepnost za aproksimacije NP-polnih problemov
