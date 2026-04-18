---
title: "APS2 – Računska zahtevnost"
tags: [aps2, zahtevnost, asimptotika, notacija, analiza]
sources: [P1.pdf, V1.pdf, DN1.pdf]
last_updated: 2026-04-18
---

# Računska zahtevnost (asimptotična analiza)

> Pozor: pri predmetu APS2 se **"računska zahtevnost"** nanaša na **asimptotično analizo** ($O$, $\Theta$, $\Omega$, $o$, $\omega$), **ne** na P/NP teorijo.

## Asimptotične notacije

### Zgornja meja $O$
$$f(n) = O(g(n)) \iff \exists c > 0, n_0 > 0: \forall n \geq n_0,\ 0 \leq f(n) \leq c \cdot g(n)$$

### Spodnja meja $\Omega$
$$f(n) = \Omega(g(n)) \iff \exists c > 0, n_0 > 0: \forall n \geq n_0,\ 0 \leq c \cdot g(n) \leq f(n)$$

### Tesna meja $\Theta$
$$f(n) = \Theta(g(n)) \iff \exists c_1, c_2 > 0, n_0 > 0: \forall n \geq n_0,\ c_1 g(n) \leq f(n) \leq c_2 g(n)$$

Ekvivalentno: $f = \Theta(g) \iff f = O(g) \land f = \Omega(g)$.

### Stroga zgornja meja $o$ ("mala o")
$$f(n) = o(g(n)) \iff \lim_{n \to \infty} \frac{f(n)}{g(n)} = 0$$

### Stroga spodnja meja $\omega$ ("mala omega")
$$f(n) = \omega(g(n)) \iff \lim_{n \to \infty} \frac{f(n)}{g(n)} = \infty$$

---

## Limitna karakterizacija

$$\lim_{n \to \infty} \frac{f(n)}{g(n)} = \begin{cases} 0 & f = o(g) \\ c \in (0, \infty) & f = \Theta(g) \\ \infty & f = \omega(g) \end{cases}$$

Za računanje limit pogosto uporabimo **L'Hôpitalovo pravilo** (oblika $\infty/\infty$ ali $0/0$).

---

## Stirlingova aproksimacija

$$n! \approx \left(\frac{n}{e}\right)^n \sqrt{2\pi n}$$

Posledica: $\lg n! = \Theta(n \log n)$.

**Dokaz**: $\lg n! \approx n(\lg n - \lg e) + \tfrac{1}{2}(\lg 2\pi + \lg n) = \Theta(n \lg n)$.

---

## Trik: prehod na osnovo $n$

Pri primerjanju $2^{n^2}$ vs $n^n$:

$$2^{n^2} = (n^{\log_n 2})^{n^2} = n^{n^2 \log_n 2} = n^{\frac{n^2}{\lg n}}$$

Ker je $\frac{n^2}{\lg n} = \omega(n)$, velja $2^{n^2} = \omega(n^n)$.

Identiteta: $a^{\log_a b} = b$ oz. $a = b^{\log_b a}$.

---

## Rang pogostih funkcij (od počasnejše do hitrejše)

$$1 \prec \lg \lg n \prec \lg n \prec \sqrt{n} \prec n \prec n \lg n \prec n^2 \prec n^3 \prec n^{\lg n} \prec 2^n \prec n! \prec n^n$$

Posebni primer iz vaj: $n^{\lg n}$ leži **strogo med** $n^k$ (za poljuben $k$) in $k^n$ (za poljuben $k > 1$).

---

## Analiza gnezdenih zank

Primer: trojno gnezdena zanka $\sum_{i=1}^{n} \sum_{j=1}^{i} \sum_{k=1}^{j} 1 = \tfrac{1}{6} n(n+1)(n+2) = \Theta(n^3)$.

Primer z delitvijo: zanka, ki vsakič razpolavlja $j$, teče $\lfloor \lg i \rfloor + 1$-krat; vsota $\sum_{i=1}^{n} \lg i = \lg n! = \Theta(n \log n)$.

---

## Analiza algoritmov urejanja (DN1)

| Algoritem | Najboljši | Povprečni | Najslabši | Prostor |
|---|---|---|---|---|
| **Navadno vstavljanje** | $\Theta(n)$ | $\Theta(n^2)$ | $\Theta(n^2)$ | $O(1)$ |
| **Urejanje z zlivanjem** | $\Theta(n \log n)$ | $\Theta(n \log n)$ | $\Theta(n \log n)$ | $O(n)$ |
| **Bogosort** | $\Theta(n)$ | $\Theta(n \cdot n!)$ | neomejeno | $O(1)$ |

**Začetne urejenosti** (parametri iz DN1):
- $U=1$: $1, 2, \ldots, N$ (urejeno)
- $U=2$: $N, N-1, \ldots, 1$ (obratno urejeno — najhuje za insertion)
- $U=3$: $1, N, 2, N-1, \ldots$ (cikcak)

---

## Povezave

- [[Asimptoticna_notacija]] — formalni pregled vseh petih notacij
- [[guide-01-Racunska_zahtevnost]] — študijski vodič
- [[APS2-Deli_in_vladaj]] — uporaba asimptotike pri rekurencah
