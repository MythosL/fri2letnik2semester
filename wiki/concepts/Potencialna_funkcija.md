---
title: "Potencialna funkcija"
tags: [aps2, amortizacija, kompleksnost, koncept]
sources: [p3.pdf]
last_updated: 2026-04-16
---

# Potencialna funkcija

## Definicija

Potencialna funkcija $\Phi$ je preslikava stanja podatkovne strukture $D_i$ v realno število:

$$\Phi: D_i \mapsto \mathbb{R}, \quad \Phi(D_i) \geq 0, \quad \Phi(D_0) = 0$$

Amortizirana cena $i$-te operacije:

$$\hat{c}_i = c_i + \underbrace{\Phi(D_i) - \Phi(D_{i-1})}_{\Delta\Phi}$$

- $\Delta\Phi > 0$: operacija "shrani" energijo za prihodnje drage operacije
- $\Delta\Phi < 0$: operacija "porabi" predhodno shranjeni potencial

---

## Ključna lastnost

$$\sum_{i=1}^{n} \hat{c}_i = \sum_{i=1}^{n} c_i + \Phi(D_n) - \Phi(D_0) \geq \sum_{i=1}^{n} c_i$$

Torej: $\sum \hat{c}_i$ je **zgornja meja** za $\sum c_i$.

Če je vsak $\hat{c}_i = O(g(n))$, potem je skupna realna cena $O(n \cdot g(n))$.

---

## Primeri potencialnih funkcij (`p3.pdf`)

### Sklad s Multipop
$$\Phi(D) = |S| \quad \text{(število elementov na skladu)}$$

| Operacija | $c_i$ | $\Delta\Phi$ | $\hat{c}_i$ |
|---|---|---|---|
| Push | 1 | +1 | 2 |
| Pop | 1 | -1 | 0 |
| Multipop($k$) | $k$ | $-k$ | 0 |

Vse operacije: $\hat{c}_i = O(1)$ → skupaj $O(n)$.

### Dinamično polje (podvojevanje)
$$\Phi(D) = 2 \cdot \text{size} - \text{capacity}$$

- Po podvojitvi: $\Phi$ pade (veliko prostora)
- Med polnjenjem: $\Phi$ raste, zbira kredit za naslednje podvojitev

Push brez podvajanja: $\hat{c} = 1 + 2 = 3 = O(1)$  
Push s podvojitvijo ($k$ kopij): $\hat{c} = k + 1 + (2 - k) = 3 = O(1)$

### Binarni števec
$$\Phi(D) = \text{število bitov } 1 \text{ v števcu}$$

- Inkrement: popravi $t$ bitov iz 1→0, en bit 0→1
- $c_i = t + 1$, $\Delta\Phi = 1 - t$
- $\hat{c}_i = (t+1) + (1-t) = 2 = O(1)$

---

## Nasveti za izbiro $\Phi$

1. $\Phi \geq 0$ vedno
2. $\Phi(D_0) = 0$ (ali majhno)
3. $\Phi$ naj narašča ob "poceni" operacijah in pada ob "dragih"
4. Cilj: $\hat{c}_i$ čim bolj konstanten

---

## Povezave

- [[APS2-Amortizirana_casovna_zahtevnost]] — celoten pregled amortizacije
