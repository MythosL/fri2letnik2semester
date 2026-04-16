---
title: "Maksimalni pretok – teorija"
tags: [aps2, pretoki, grafi, max-flow, min-cut, teorija]
sources: [maksimalni_pretoki.pdf]
last_updated: 2026-04-16
---

# Maksimalni pretok – teorija

## Izrek max-flow min-cut

$$\max |f| = \min \text{ kapaciteta prereza}$$

**Dokaz (ekvivalentnost treh pogojev)**:

Naslednje tri izjave so ekvivalentne:
1. $f$ je maksimalni pretok v $G$
2. V preostalemu omrežju $G_f$ ne obstaja povečujoča pot od $s$ do $t$
3. $|f|$ = kapaciteta nekega prereza $(S, T)$

---

## Prerez in kapaciteta

**$(s,t)$-prerez**: razdelitev $V = S \cup T$, $s \in S$, $t \in T$.

$$c(S,T) = \sum_{u \in S} \sum_{v \in T} c(u,v)$$

**Neto pretok** skozi prerez:
$$f(S,T) = \sum_{u \in S} \sum_{v \in T} f(u,v) - \sum_{u \in S} \sum_{v \in T} f(v,u) = |f|$$

---

## Preostalo omrežje

Za vsako direktno $(u,v)$:
- Preostala kapaciteta naprej: $c_f(u,v) = c(u,v) - f(u,v)$
- Povratna kapaciteta: $c_f(v,u) = f(u,v)$

Povratne povezave **omogočajo odpravljanje napak** v pretoku (razveljavitev napačnih odločitev).

---

## Augmentacijska pot

Pot $p$ od $s$ do $t$ v $G_f$ z $c_f(u,v) > 0$ za vsako $(u,v) \in p$.

**Zalog**: $c_f(p) = \min_{(u,v) \in p} c_f(u,v)$

Po vsaki augmentaciji: $|f|$ se poveča za $c_f(p) > 0$.

---

## Konvergenca

- **Ford-Fulkerson** (splošno): konvergira le pri racionalnih kapacitetah
- **Edmonds-Karp** (BFS poti): vedno konvergira v $O(VE)$ augmentacijah

---

## Povezave

- [[APS2-Maksimalni_pretoki]] — algoritmi in aplikacije
- [[APS2-Sprehod_po_grafih]] — BFS/DFS za iskanje poti v grafu
