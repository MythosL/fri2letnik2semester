---
title: "APS2 – Sprehod po grafih"
tags: [aps2, grafi, bfs, dfs, topološko-urejanje, scc]
sources: [predavanje_sprehodi_po_grafih.pdf, vaje07.pdf]
last_updated: 2026-04-16
---

# Sprehod po grafih

## BFS – Iskanje v širino

**Ideja**: obišči vse sosede vozlišča $s$, preden greš globlje.

```
BFS(G, s):
  za vsak u ≠ s: barva[u] = BELA, d[u] = ∞
  barva[s] = SIVA, d[s] = 0
  Q = {s}
  while Q ≠ ∅:
    u = DEQUEUE(Q)
    za vsak sosed v od u:
      if barva[v] == BELA:
        barva[v] = SIVA, d[v] = d[u]+1, π[v] = u
        ENQUEUE(Q, v)
    barva[u] = ČRNA
```

- **Zahtevnost**: $O(V + E)$
- **Rezultat**: najkrajše poti (po številu povezav) od $s$ do vseh dosegljivih vozlišč
- Drevo BFS: $\pi[v]$ predhodnik, $d[v]$ razdalja

---

## DFS – Iskanje v globino

**Ideja**: pojdi čim globlje, nato se vrni nazaj.

```
DFS(G):
  za vsak u: barva[u] = BELA, π[u] = NIL, čas = 0
  za vsak u:
    if barva[u] == BELA: DFS-VISIT(u)

DFS-VISIT(u):
  barva[u] = SIVA, d[u] = ++čas
  za vsak sosed v od u:
    if barva[v] == BELA:
      π[v] = u; DFS-VISIT(v)
  barva[u] = ČRNA, f[u] = ++čas
```

- **Zahtevnost**: $O(V + E)$
- **Časovni žigi**: $d[u]$ (odkritje), $f[u]$ (zaključek)
- Lastnost oklepanja: $[d[v], f[v]] \subseteq [d[u], f[u]]$ ali disjunktno

---

## Klasifikacija povezav (DFS)

| Tip | Opis | Kdaj |
|---|---|---|
| **Drevesna** | $u \to v$, $v$ odkrit prek $u$ | $v$ je bil bel |
| **Povratna** | $u \to v$, $v$ je predhodnik $u$ | $v$ je siv |
| **Napredna** | $u \to v$, $v$ je potomec $u$ | $v$ je črn, $d[u] < d[v]$ |
| **Prečna** | $u \to v$, brez razmerja | $v$ je črn, $d[u] > d[v]$ |

> V neusmerjenih grafih obstajajo samo **drevesne** in **povratne** povezave.

---

## Topološko urejanje

Za **DAG** (usmerjen acikličen graf): linearno urejanje vozlišč tako, da za vsako $u \to v$ velja $u$ pred $v$.

**Algoritem**: zaženi DFS, dodaj vozlišče na začetek seznama ob zaključku.

```
TOPOLOŠKO-UREDI(G):
  zaženi DFS(G)
  ob vsaki ČRNI barvi: dodaj u na začetek L
  vrni L
```

- Graf mora biti **brez ciklov** (DAG)
- Cikel ↔ povratna povezava v DFS

---

## Močno povezane komponente (SCC)

**Definicija**: SCC je maksimalna podmnožica vozlišč, kjer sta $u$ in $v$ medsebojno dosegljiva.

### Kosarajujev algoritem (2 prehoda DFS)

1. Zaženi DFS na $G$, zabeleži $f[u]$ za vsako vozlišče
2. Tvori $G^T$ (transponirani graf — obrni vse povezave)
3. Zaženi DFS na $G^T$ v **padajočem** vrstnem redu $f[u]$
4. Vsako DFS drevo v 2. prehodu = ena SCC

- **Zahtevnost**: $O(V + E)$

---

## Primerjava BFS vs DFS

| | BFS | DFS |
|---|---|---|
| Struktura | vrsta (FIFO) | sklad / rekurzija |
| Razdalje | najkrajše poti | ni optimalno |
| Zahtevnost | $O(V+E)$ | $O(V+E)$ |
| Uporaba | shortest path, SCC | topološko, SCC, backtracking |

---

## Povezave

- [[APS2-Pozresni_algoritmi]] — Dijkstra, Prim, Kruskal (grafi + pohlepnost)
- [[APS2-Maksimalni_pretoki]] — pretoki v grafih
