---
title: "APS2 – Požrešni algoritmi"
tags: [aps2, pohlepni, mst, huffman, dijkstra, optimizacija]
sources: [p4.pdf, v4.pdf]
last_updated: 2026-04-16
---

# Požrešni algoritmi (Greedy)

## Paradigma

Pohlepni algoritem sprejema **lokalno optimalne odločitve** v upanju, da bo skupna rešitev globalno optimalna.

**Pogoji za pravilnost**:
1. **Optimalna podstruktura** — optimalna rešitev vsebuje optimalne podzrešitve
2. **Pohlepna lastnost** — lokalno optimalna izbira je del neke globalno optimalne rešitve

> Razlika od DP: nikoli ne preverjamo alternativ — odločitev je dokončna.

---

## Izbira aktivnosti (`p4.pdf`)

- **Vhod**: $n$ aktivnosti z začetki $s_i$ in konci $f_i$
- **Izhod**: največji nabor nezdružljivih aktivnosti

**Algoritem**:
1. Uredi aktivnosti po **končnem času** $f_i$ naraščajoče
2. Vedno izberi aktivnost z najmanjšim $f_i$, ki se ne prekriva z zadnjo izbrano

- **Zahtevnost**: $O(n \log n)$ (urejanje)
- **Dokaz**: zamenjalni argument — zamenjaj katero koli rešitev z pohlepno, ne poslabšamo

---

## Huffmanova koda (`p4.pdf`)

**Ideja**: pogostejšim znakom dodelimo krajše kode (optimalno prefiksno kodiranje).

```
HUFFMAN(C):
  Q = min-kopica vseh znakov (ključ = frekvenca)
  for i = 1 to |C|-1:
    z = novi node
    z.levo = x = EXTRACT-MIN(Q)
    z.desno = y = EXTRACT-MIN(Q)
    z.freq = x.freq + y.freq
    INSERT(Q, z)
  return EXTRACT-MIN(Q)  // koren drevesa
```

- **Zahtevnost**: $O(n \log n)$
- Koda je **optimalna** prefiksna koda za dano porazdelitev frekvenc
- Levo otrok = bit 0, desni = bit 1

---

## Minimalno vpeto drevo (MST)

MST grafa $G=(V,E,w)$: vpeto drevo z minimalno vsoto uteži.

### Kruskalov algoritem

1. Uredi vse povezave po utežeh naraščajoče
2. Za vsako povezavo $(u,v)$: če $u$ in $v$ nista v isti komponenti → dodaj v MST (Union-Find)

- **Zahtevnost**: $O(E \log E)$
- Primeren za **redke grafe**

### Primov algoritem

1. Začni v poljubnem vozlišču, ostala so v vrsti s prioriteto $\infty$
2. Iterativno dodaj vozlišče z najmanjšo ključno vrednostjo (= minimalna teža povezave do MST)
3. Posodobi ključe sosedov

- **Zahtevnost**: $O(E \log V)$ (s kopico)
- Primeren za **geste grafe**

---

## Dijkstrov algoritem (kratke poti)

**Vhod**: utežen graf z nenegativnimi utežmi, izvor $s$  
**Izhod**: najkrajše poti od $s$ do vseh vozlišč

```
DIJKSTRA(G, w, s):
  d[s] = 0; d[v] = ∞ za vse v ≠ s
  Q = min-kopica vseh vozlišč (ključ = d)
  while Q ≠ ∅:
    u = EXTRACT-MIN(Q)
    za vsak sosed v od u:
      if d[u] + w(u,v) < d[v]:
        d[v] = d[u] + w(u,v); π[v] = u
        DECREASE-KEY(Q, v, d[v])
```

- **Zahtevnost**: $O(E \log V)$ (binarni kopica), $O(E + V \log V)$ (Fibonacci kopica)
- **Pogoj**: uteži $\geq 0$

---

## Primerjava pohlepnih algoritmov

| Algoritem | Problem | Zahtevnost |
|---|---|---|
| Izbira aktivnosti | max neodvisnih intervalov | $O(n \log n)$ |
| Huffman | optimalno kodiranje | $O(n \log n)$ |
| Kruskal | MST | $O(E \log E)$ |
| Prim | MST | $O(E \log V)$ |
| Dijkstra | najkrajše poti ($w \geq 0$) | $O(E \log V)$ |

---

## Povezave

- [[APS2-Sprehod_po_grafih]] — BFS/DFS kot osnova za grafne algoritme
- [[APS2-Dinamicno_programiranje]] — alternativa, ko pohlepnost ne zadostuje
- [[Divide_and_conquer]] — sorodna paradigma
