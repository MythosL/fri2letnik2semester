---
title: "APS2 – Amortizirana časovna zahtevnost"
tags: [aps2, kompleksnost, amortizacija]
sources: [p3.pdf, v3.pdf, dn3.pdf]
last_updated: 2026-04-16
---

# Amortizirana časovna zahtevnost

## Osnovna ideja

Amortizirana analiza meri **povprečno ceno na operacijo** v zaporedju $n$ operacij — ne v najslabšem primeru posamezne operacije, temveč skupno ceno delimo z $n$.

$$T_{\text{amor}} = \frac{\sum_{i=1}^{n} c_i}{n}$$

> Brez verjetnosti: velja za vsako zaporedje vhodov.

---

## Metode

### 1. Agregatna metoda (Aggregate method)
Izračunamo skupno ceno $T(n)$ celotnega zaporedja, nato:
$$t_{\text{amor}} = \frac{T(n)}{n}$$

**Primer – binarni števec** (`p3.pdf`):  
- `n` inkrementov na $k$-bitnem števcu  
- Bit $i$ se obrne vsaj $\lfloor n/2^i \rfloor$-krat  
- Skupno obratov: $\sum_{i=0}^{k-1} \lfloor n/2^i \rfloor < 2n$  
- Amortizirana cena: $O(1)$ na inkrement

---

### 2. Bančniška metoda (Accounting / Banker's method)
Vsakemu klicu priredimo **amortiziran strošek** $\hat{c}_i \geq c_i$.  
Razlika $\hat{c}_i - c_i$ se shrani kot **kredit** na podatkovni strukturi.  
Zahteva: kredit nikoli negativen.

$$\sum_{i=1}^{n} \hat{c}_i \geq \sum_{i=1}^{n} c_i$$

**Primer – dinamično polje** (`p3.pdf`):  
- `push`: $\hat{c} = 3$ (1 za vstavljanje + 2 za bodoče kopiranje)  
- Podvoji se ko je polje polno; kopiranje plačano s kreditom  
- Amortizirana cena `push`: $O(1)$

---

### 3. Potencialna metoda (Physicist's / Potential method)
Definiramo [[Potencialna_funkcija|potencialno funkcijo]] $\Phi: DS \to \mathbb{R}_{\geq 0}$.

$$\hat{c}_i = c_i + \Phi(D_i) - \Phi(D_{i-1})$$

$$\sum \hat{c}_i = \sum c_i + \Phi(D_n) - \Phi(D_0)$$

Ker $\Phi(D_n) \geq \Phi(D_0) = 0$, velja $\sum \hat{c}_i \geq \sum c_i$.

**Primer – sklad s Multipop** (`p3.pdf`):  
- $\Phi$ = število elementov na skladu  
- `push`: $\hat{c} = 1 + 1 = 2$  
- `pop`: $\hat{c} = 1 - 1 = 0$  
- `Multipop(k)`: $\hat{c} = k - k = 0$  
- Amortizirana cena: $O(1)$ za vsako operacijo

---

## Primeri iz vaj (`v3.pdf`)

| Struktura | Operacija | Realna cena | Amortizirana |
|---|---|---|---|
| Binarni števec | inkrement | $O(k)$ worst | $O(1)$ |
| Dinamično polje | push | $O(n)$ worst | $O(1)$ |
| Sklad + Multipop | vse op. | $O(n)$ worst | $O(1)$ |

---

## Povezave

- [[Potencialna_funkcija]] — formalna definicija $\Phi$
- [[APS2-Deli_in_vladaj]] — druga tema APS2
- [[APS2-Dinamicno_programiranje]] — tretja tema APS2
