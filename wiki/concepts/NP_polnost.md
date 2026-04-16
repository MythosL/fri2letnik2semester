---
title: "NP-polnost"
tags: [aps2, zahtevnost, np-polnost, redukcije, teorija]
sources: [P1.pdf]
last_updated: 2026-04-16
---

# NP-polnost

## Formalna definicija

Problem $B$ je **NP-poln**, če:
1. $B \in NP$: certifikat rešitve je preverljiv v polinomskem času
2. $\forall A \in NP: A \leq_p B$: vsak NP problem se reducira na $B$

---

## Polinomska redukcija $A \leq_p B$

Obstaja funkcija $f$, izračunljiva v polinomskem času, taka da:
$$x \in A \iff f(x) \in B$$

**Lastnosti**:
- Če $B \in P$ in $A \leq_p B$, potem $A \in P$
- Če $B$ je NP-poln in $B \leq_p C$ in $C \in NP$, potem $C$ je NP-poln

---

## Cook-Levinov izrek

**SAT** (zadovoljljivost logičnih formul v KNF) je NP-poln.

**Ideja dokaza**: vsak nedeterministični TM se simulira z logično formulo — sprejemanje ↔ zadovoljljivost.

---

## Veriga redukcij

```
SAT ≤_p 3-SAT ≤_p Independent Set ≤_p Vertex Cover ≤_p Clique
                                              ↓
                                        Subset Sum ≤_p Knapsack
                    Hamilton cikel ≤_p TSP
```

---

## Kako dokazati NP-polnost novega problema $X$

1. Pokaži $X \in NP$: opiši certifikat in preverjanje v polinomskem času
2. Izberi znan NP-poln problem $A$ (npr. 3-SAT, Vertex Cover)
3. Konstruiraj redukcijo $A \leq_p X$ (ne $X \leq_p A$!)
4. Dokaži pravilnost: $a \in A \iff f(a) \in X$
5. Dokaži polinomskost: $f$ se izračuna v polinomskem času

---

## Razlika: NP-poln vs NP-težak

| | NP-poln | NP-težak |
|---|---|---|
| V razredu NP | Da | Ni nujno |
| Vsaj tako težek kot vsi NP | Da | Da |
| Primer | SAT, TSP | Halting problem |

---

## Povezave

- [[APS2-Racunska_zahtevnost]] — kontekst in primeri
