---
title: "APS2 – Maksimalni pretoki"
tags: [aps2, pretoki, grafi, ford-fulkerson, edmonds-karp, bipartitno-ujemanje]
sources: [maksimalni_pretoki.pdf, dosegljivost.pdf]
last_updated: 2026-04-16
---

# Maksimalni pretoki

## Mreža pretokov

**Definicija**: usmerjen graf $G = (V, E)$ s:
- kapaciteto $c(u,v) \geq 0$ za vsako povezavo
- izvorom $s$ in ponorom $t$

**Pretok** $f: V \times V \to \mathbb{R}$ mora zadoščati:
1. **Omejitev kapacitete**: $0 \leq f(u,v) \leq c(u,v)$
2. **Ohranjanje pretoka**: za vsak $u \neq s, t$: $\sum_v f(v,u) = \sum_v f(u,v)$

**Vrednost pretoka**: $|f| = \sum_v f(s,v) - \sum_v f(v,s)$

---

## Preostalo omrežje (Residual Graph)

Za omrežje $G$ in pretok $f$ definiramo $G_f$:
- Preostala kapaciteta: $c_f(u,v) = c(u,v) - f(u,v)$
- Za vsako $(u,v)$ z $f(u,v) > 0$ dodamo **povratno** povezavo $(v,u)$ s kapaciteto $f(u,v)$

**Povečujoča pot**: pot od $s$ do $t$ v $G_f$ z $c_f > 0$ na vsaki povezavi.

---

## Izrek o maksimalnem pretoku in minimalnem prerezu

$$|f^*| = \text{kapaciteta minimalnega prereza}$$

**Prerez** $(S, T)$: razdelitev $V$ na $S \ni s$ in $T \ni t$.  
**Kapaciteta prereza**: $\sum_{u \in S, v \in T} c(u,v)$

**Posledica**: $f$ je maksimalen $\iff$ v $G_f$ ne obstaja povečujoča pot.

---

## Ford-Fulkersonova metoda (`maksimalni_pretoki.pdf`)

```
FORD-FULKERSON(G, s, t):
  f[u][v] = 0 za vse (u,v)
  while obstaja povečujoča pot p v G_f:
    cf(p) = min { cf(u,v) : (u,v) ∈ p }
    za vsako (u,v) ∈ p:
      f[u][v] += cf(p)
      f[v][u] -= cf(p)
  return f
```

- **Zahtevnost**: $O(E \cdot |f^*|)$ — odvisna od vrednosti pretoka!
- Problem: pri iracionalnih kapacitetah morda ne konvergira

---

## Edmonds-Karpov algoritem

Ford-Fulkerson z **BFS** za iskanje povečujoče poti (najkrajša pot po številu povezav).

- **Zahtevnost**: $O(V E^2)$ — neodvisna od vrednosti pretoka
- Vsaka povečujoča pot skrajša ali ohrani razdalje

---

## Primerjava algoritmov

| Algoritem | Iskanje poti | Zahtevnost |
|---|---|---|
| Ford-Fulkerson | DFS / katera koli | $O(E \cdot |f^*|)$ |
| Edmonds-Karp | BFS (najkrajša) | $O(VE^2)$ |
| Dinic | BFS + blokirni pretoki | $O(V^2 E)$ |

---

## Bipartitno ujemanje (`dosegljivost.pdf`)

**Problem**: dano bipartitno omrežje $G = (L \cup R, E)$; najdi največje ujemanje.

**Redukcija na max-pretok**:
1. Dodaj izvor $s$ z robovi $s \to l$ za vsak $l \in L$ (kapaciteta 1)
2. Dodaj ponor $t$ z robovi $r \to t$ za vsak $r \in R$ (kapaciteta 1)
3. Vse obstoječe povezave $l \to r$ (kapaciteta 1)
4. Maksimalni pretok = maksimalno ujemanje

- **Zahtevnost**: $O(VE)$ (Ford-Fulkerson na bipartitnem grafu)

---

## Dosegljivost in pretoki

- **Dosegljivost**: vozlišče $v$ je dosegljivo iz $s$, če obstaja pot z neničelno kapaciteto
- Minimalni prerez določa "ozko grlo" omrežja
- Aplikacije: omrežne zmogljivosti, razporejanje, transport

---

## Povezave

- [[APS2-Sprehod_po_grafih]] — BFS/DFS kot osnova za iskanje poti
- [[Maksimalni_pretok]] — formalni pregled teorije pretokov
- [[APS2-Pozresni_algoritmi]] — pohlepni pristopi na grafih
