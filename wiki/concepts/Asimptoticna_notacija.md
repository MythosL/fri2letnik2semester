---
title: "Asimptotična notacija"
tags: [aps2, zahtevnost, asimptotika, teorija]
sources: [P1.pdf, V1.pdf]
last_updated: 2026-04-18
---

# Asimptotična notacija

## Pet osnovnih notacij

| Notacija | Formalna definicija | Limitna oblika | Pomen |
|---|---|---|---|
| $f = O(g)$ | $\exists c, n_0: 0 \leq f(n) \leq c\,g(n)\ \forall n \geq n_0$ | $\lim f/g < \infty$ | zgornja meja |
| $f = \Omega(g)$ | $\exists c, n_0: 0 \leq c\,g(n) \leq f(n)$ | $\lim f/g > 0$ | spodnja meja |
| $f = \Theta(g)$ | $O(g) \cap \Omega(g)$ | $\lim f/g = c \in (0, \infty)$ | tesna meja |
| $f = o(g)$ | $\forall c > 0 \exists n_0: f(n) < c\,g(n)$ | $\lim f/g = 0$ | stroga zgornja |
| $f = \omega(g)$ | $\forall c > 0 \exists n_0: c\,g(n) < f(n)$ | $\lim f/g = \infty$ | stroga spodnja |

**Analogija z realnimi števili**:
- $O \leftrightarrow \leq$
- $\Omega \leftrightarrow \geq$
- $\Theta \leftrightarrow =$
- $o \leftrightarrow <$
- $\omega \leftrightarrow >$

---

## Tehnike dokazovanja

### Direktno (konstante)
Dokaz $2n^2 + 7n + 3 = \Theta(n^2)$: izberi $c_1 = 1, c_2 = 3, n_0 = 10$:
- $2n^2 + 7n + 3 \geq n^2$ za vsak $n \geq 10$
- $2n^2 + 7n + 3 \leq 3n^2$ za vsak $n \geq 10$ (iz $n^2 - 7n - 3 \geq 0$)

### Limitna metoda
$$\lim_{n \to \infty} \frac{2n^2 + 7n + 3}{n^2} = 2 \in (0, \infty) \Rightarrow \Theta(n^2)$$

### L'Hôpital (oblika $\infty/\infty$ ali $0/0$)
Primer: $n = \omega(\lg^2 n)$?

$$\lim_{n \to \infty} \frac{\lg^2 n}{n} = \lim \frac{\ln^2 n}{n \ln^2 2} \stackrel{L}{=} \lim \frac{2 \ln n}{n \ln^2 2} \stackrel{L}{=} \lim \frac{2}{n \ln^2 2} = 0$$

Torej $\lg^2 n = o(n)$, ekvivalentno $n = \omega(\lg^2 n)$.

### Prehod na skupno osnovo
Primerjava $2^{n^2}$ in $n^n$ prek identitete $a = b^{\log_b a}$:
$$2^{n^2} = n^{n^2 \log_n 2} = n^{n^2 / \lg n}$$
Ker $n^2/\lg n = \omega(n)$: $2^{n^2} = \omega(n^n)$.

### Stirlingova formula
$n! \approx (n/e)^n \sqrt{2\pi n}$

$$\lg n! = n(\lg n - \lg e) + \tfrac{1}{2}(\lg 2\pi + \lg n) = \Theta(n \log n)$$

---

## Lastnosti

**Tranzitivnost**: $f = O(g) \land g = O(h) \Rightarrow f = O(h)$.

**Refleksivnost**: $f = O(f), \Omega(f), \Theta(f)$ (ne pa $o$ ali $\omega$).

**Simetrija**: $f = \Theta(g) \iff g = \Theta(f)$.

**Transpozicijska simetrija**: $f = O(g) \iff g = \Omega(f)$, $f = o(g) \iff g = \omega(f)$.

---

## Pogoste pasti

- **$O$ ni "povprečje"** — je zgornja meja (največja možna)
- **$n^{\lg n}$ je med polinomi in eksponenti** — ni ne en ne drug
- **Prehod na limito zahteva, da limita obstaja** — če oscilira, limitna metoda odpove
- **"Velja za dovolj velike $n$"** — notacije ne opisujejo obnašanja pri majhnih $n$

---

## Povezave

- [[APS2-Racunska_zahtevnost]] — kontekst in dodatni primeri
- [[guide-01-Racunska_zahtevnost]] — študijski vodič
