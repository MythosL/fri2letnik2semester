---
title: "Študijski vodič 01 – Računska zahtevnost (asimptotična analiza)"
tags: [aps2, vodic, ucenje, zahtevnost, asimptotika, notacija, flashcards]
type: study-guide
order: 1
last_updated: 2026-04-18
---

# Študijski vodič 01 – Računska zahtevnost

> Cilj: po tem vodiču boš pri katerikoli funkciji znal v nekaj sekundah povedati njen asimptotski razred in znal formalno dokazati trditev z uporabo konstant ali limit.

## 1. Bistvo v enem stavku

**"Asimptotika vpraša: kako raste funkcija, ko $n \to \infty$ — ne meni se za majhne $n$ in konstante."**

---

## 2. Intuicija – zakaj to potrebujemo

Dva algoritma uredita 1000 števil:
- Prvi: $5n^2 + 100$ operacij = 5 000 100
- Drugi: $100 n \log_2 n + 1000$ operacij = 997 685

Pri $n = 10$? Prvi zmaga (600 vs 3332). Pri $n = 10^6$? Drugi je **250 000× hitrejši**.

**Asimptotika** opiše **dolgoročno zmago** — ignorira konstante in členke nižjega reda, ker postanejo nepomembni.

---

## Vizualizacija: funkcijska hierarhija

![[funkcijska-hierarhija.excalidraw]]

---

## 3. Ključne pripodobe

### Pripodoba A: Primerjava avtomobilov na avtocesti
- $O$ = "največ tako hiter kot Ferrari" — zgornja meja
- $\Omega$ = "vsaj tako hiter kot traktor" — spodnja meja
- $\Theta$ = "isti razred kot povsem enak avto"
- $o$ = "strogo počasnejši" (Ferrari $\neq$ Ferrari)
- $\omega$ = "strogo hitrejši"

### Pripodoba B: Prvaki v telovadnici
Funkcije razvrstimo po "moči":
$$1 \prec \lg\lg n \prec \lg n \prec \sqrt{n} \prec n \prec n\lg n \prec n^2 \prec n^{\lg n} \prec 2^n \prec n! \prec n^n$$

Kot uteži: logaritem je "lahkotni pionir", $n!$ in $n^n$ sta "super-težki kategoriji".

### Pripodoba C: Pravila za bližnjice
- "Pozabi vse razen največjega člena": $3n^2 + 100n + 5 \to n^2$
- "Pozabi konstante": $1000n \to n$
- "Logaritme ne glede na osnovo": $\lg n = \Theta(\ln n) = \Theta(\log n)$

### Pripodoba D: Stirling kot "tajni orožji"
Ko vidiš $n!$, pomisli:
$$\lg n! = \Theta(n \log n)$$
Stirling skrči "faktorialno pošast" na $n \log n$ za analizo (npr. pri dokazih spodnje meje primerjalnega urejanja).

### Pripodoba E: L'Hôpitalov trik
Ne znaš izračunati limite $\lim \frac{f(n)}{g(n)}$? Odvajaj oba — L'Hôpital velja za oblike $\infty/\infty$ in $0/0$. Po potrebi **večkrat**.

---

## 4. Preslikave v druge domene

| Domena | Uporaba asimptotike |
|---|---|
| **Fizika** | Limitno obnašanje sistemov pri $T \to 0$ ali $N \to \infty$ |
| **Statistika** | Asimptotska porazdelitev cenilk, CLT |
| **Inženirstvo** | "Big-O" zmogljivosti sistemov |
| **Numerika** | Red napake: $O(h^2)$ za trapezno pravilo |
| **Database načrtovanje** | Izbira indeksiranja glede na rast velikosti baze |

---

## 5. Formalno jedro

### Definiciji z konstantami

$$f = O(g) \iff \exists c > 0, n_0 > 0: \forall n \geq n_0,\ 0 \leq f(n) \leq c\,g(n)$$

$$f = \Theta(g) \iff \exists c_1, c_2 > 0, n_0 > 0: c_1 g(n) \leq f(n) \leq c_2 g(n)$$

### Limitna pravila

$$\lim_{n\to\infty} \frac{f(n)}{g(n)} = \begin{cases} 0 & f = o(g) \\ c \in (0,\infty) & f = \Theta(g) \\ \infty & f = \omega(g) \end{cases}$$

### Stirlingova aproksimacija

$$n! \approx \sqrt{2\pi n}\left(\frac{n}{e}\right)^n \quad\Rightarrow\quad \lg n! = \Theta(n \log n)$$

---

## 6. Mentalno orodje: 3-korakna klasifikacija

1. **Poenostavi**: odstrani konstante, obdrži vodilni člen
2. **Prevedi na znano**: uporabi Stirling, $a = b^{\log_b a}$, logaritemske identitete
3. **Preveri z limito**: če ni očitno, izračunaj $\lim f/g$ (po potrebi z L'Hôpital)

**Primer**: $f(n) = 2^{\ln n}$, primerjaj z $n$.
- Korak 2: $2^{\ln n} = (e^{\ln 2})^{\ln n} = e^{\ln n \cdot \ln 2} = n^{\ln 2}$
- Ker $\ln 2 \approx 0{,}693 < 1$: $n^{\ln 2} = o(n)$
- Ker $\ln 2 > 1/2$: $n^{\ln 2} = \omega(\sqrt{n})$
- **Zaključek**: $\sqrt{n} \prec 2^{\ln n} \prec n$

---

## 7. Kanonični primeri iz vaj

### Primer 1 — polinom
$$2n^2 + 7n + 3 = \Theta(n^2)$$
Z $c_1 = 1, c_2 = 3, n_0 = 10$ oba neenačaja veljata. Limitna metoda: $\lim = 2$.

### Primer 2 — logaritem proti linearnemu
$$n = \omega(\lg^2 n)$$
L'Hôpital dvakrat na $\lg^2 n / n$ da 0, torej $\lg^2 n = o(n)$.

### Primer 3 — faktorial
$$\lg n! = \Theta(n \log n)$$
Neposredno iz Stirling.

### Primer 4 — trojno gnezdenje
```c
for (i=1..n) for (j=1..i) for (k=1..j) print;
```
$$\sum_{i=1}^{n} \sum_{j=1}^{i} j = \tfrac{1}{6}n(n+1)(n+2) = \Theta(n^3)$$

### Primer 5 — zanka z razpolavljanjem
```c
for (i=1..n) { j=i; while(j>0) { j/=2; ... } }
```
$\sum \lfloor \lg i \rfloor + 1 = \Theta(n \log n)$ (navzgor omejeno s $\lg n!$).

---

## 8. Naloge

### Naloga 1
Dokaži: $n \log n + n = \Theta(n \log n)$.

<details>
<summary>Rešitev</summary>

Z limito: $\lim \frac{n \log n + n}{n \log n} = 1 + \lim \frac{1}{\log n} = 1$. Torej $\Theta(n \log n)$.

Z konstantami: $n \log n \leq n \log n + n \leq 2 n \log n$ za $n \geq 2$.
</details>

### Naloga 2
Primerjaj rast: $n^{\log n}$ vs $2^n$.

<details>
<summary>Rešitev</summary>

Vzamemo logaritem: $\lg(n^{\log n}) = (\log n)^2$ vs $\lg(2^n) = n$. Ker $(\log n)^2 = o(n)$ (dvakrat L'Hôpital), velja $n^{\log n} = o(2^n)$.
</details>

### Naloga 3
Kolikokrat se izvede zanka?
```c
for (i=1; i<=n; i*=2) for (j=1; j<=i; j++) print;
```

<details>
<summary>Rešitev</summary>

Zunanja zanka teče $\lfloor \lg n \rfloor + 1$ obhodov z $i = 1, 2, 4, \ldots, 2^{\lfloor \lg n \rfloor}$. Skupaj:
$$\sum_{k=0}^{\lfloor \lg n \rfloor} 2^k = 2^{\lfloor \lg n \rfloor + 1} - 1 = \Theta(n)$$
</details>

### Naloga 4
Ali je $n^{1{,}5} = O(n \log^{100} n)$?

<details>
<summary>Rešitev</summary>

Ne. $\lim \frac{n^{1{,}5}}{n \log^{100} n} = \lim \frac{n^{0{,}5}}{\log^{100} n} = \infty$ (polinom premaga polilog). Torej $n^{1{,}5} = \omega(n \log^{100} n)$.
</details>

### Naloga 5 (sinteza — DN1)
V programu za DN1 trije algoritmi urejanja (insertion, merge, bogosort). Za katero začetno urejenost $U$ dobiš **najhujši** čas pri vsakem algoritmu?

<details>
<summary>Rešitev</summary>

- **Insertion sort**: $U = 2$ (obratno urejeno) — $\Theta(n^2)$ inverzij
- **Merge sort**: vse enake, $\Theta(n \log n)$ neodvisno od $U$
- **Bogosort**: pričakovano $\Theta(n \cdot n!)$, dejanski čas je naključen

Pri $U = 1$ je insertion sort najhitrejši ($\Theta(n)$, ker ne dela zamenjav).
</details>

---

## 9. Preveri sam(a) sebe

1. Kako definiraš $O(g)$ s konstantami $c, n_0$?
2. Kdaj uporabiš L'Hôpital? Kakšne oblike potrebuje?
3. Zakaj je $\lg n! = \Theta(n \log n)$?
4. Razvrsti: $n^2$, $n \log n$, $\sqrt{n}$, $2^n$, $n!$, $1$ po rasti.
5. Zakaj $n^{\lg n}$ ni niti polinom niti eksponent?

---

## 10. Najpogostejše pasti

- **Asimptotika ≠ dejanski čas pri majhnih $n$** — algoritem z $10000n$ je lahko počasnejši od $n^2$ do $n = 10000$
- **"$O$" ne pomeni "je točno tako velik"** — uporabi $\Theta$ za tesno trditev
- **Logaritmi brez osnove**: $\log n$ v asimptotski notaciji je enakovreden kateremkoli $\log_b n$, ampak **znotraj eksponenta** razlika lahko šteje
- **Limita ne obstaja vedno** — oscilirajoče funkcije zahtevajo $\liminf, \limsup$
- **Mešanje $O$ in $o$** — $O$ dovoli $f/g \to c$, $o$ zahteva $f/g \to 0$

---

## 11. Povezave

- [[APS2-Racunska_zahtevnost]] — referenca
- [[Asimptoticna_notacija]] — formalni pregled
- Naslednji vodič: [[guide-02-Deli_in_vladaj]]

---

## 12. Kartice za aktivni priklic (#flashcards)

> Za vtičnik **Spaced Repetition** (Stephen Mwangi). Sintaksa: inline `Q::A`, reverse `Q:::A`.

### Definicije

$O(g)$ formalna definicija?::$\exists c>0, n_0>0: \forall n \geq n_0,\ 0 \leq f(n) \leq c\,g(n)$

$\Theta(g)$ kot limita?::$\lim f(n)/g(n) = c$, kjer $c \in (0, \infty)$

$o(g)$ kot limita?::$\lim f(n)/g(n) = 0$

$\omega(g)$ kot limita?::$\lim f(n)/g(n) = \infty$

Razlika $O$ in $o$?::$O$ dovoli $\lim = c$; $o$ zahteva $\lim = 0$ (strogo manjši)

### Ključni rezultati

Stirlingova formula za $n!$?::$n! \approx \sqrt{2\pi n}(n/e)^n$

$\lg n!$ v asimptotski obliki?::$\Theta(n \log n)$

$n^{\lg n}$ primerjava z $n^k$ in $k^n$?::$n^k = o(n^{\lg n}) = o(k^n)$ (leži med polinomi in eksponenti)

$2^{\ln n}$ poenostavljeno?::$n^{\ln 2}$ (uporabi identiteto $a = b^{\log_b a}$)

### Tehnike

L'Hôpital velja za katere oblike?::$\infty/\infty$ in $0/0$

Kako klasificiraš v 3 korakih?::1) poenostavi vodilni člen, 2) prevedi na znano (Stirling, identitete), 3) preveri z limito

Razvrsti po rasti:
?
$1 \prec \lg\lg n \prec \lg n \prec \sqrt{n} \prec n \prec n\lg n \prec n^2 \prec n^{\lg n} \prec 2^n \prec n! \prec n^n$
