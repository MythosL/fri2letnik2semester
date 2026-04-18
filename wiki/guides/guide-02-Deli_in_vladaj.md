---
title: "Študijski vodič 02 – Deli in vladaj"
tags: [aps2, vodic, ucenje, deli-in-vladaj, rekurzija]
type: study-guide
order: 2
last_updated: 2026-04-18
---

# Študijski vodič 02 – Deli in vladaj

> Cilj: ko vidiš rekurenčno enačbo, boš v 10 sekundah znal povedati zahtevnost.

## 1. Bistvo v enem stavku

**"Problem, ki ga ne znaš rešiti, razbij na dva (ali več) manjših problemov iste vrste."**

---

## 2. Intuicija – zakaj deluje

Če imaš problem velikosti $n$:
- Preveč, da ga rešiš direktno
- **Ampak**: $n/2$ je polovico lažje. Če dvakrat rešiš $n/2$, imaš dva rezultata.
- Potrebuješ samo **pametno združevanje** rezultatov.

---

## 3. Ključne pripodobe

### Pripodoba A: Telefonski imenik (Binarno iskanje)
- Hočeš najti "Novak"
- Odpreš **na sredini** → vidiš "Marko"
- "N > M" → odpreš **drugo polovico**
- V $\log n$ korakih najdeš karkoli
- Rekurenca: $T(n) = T(n/2) + 1$

### Pripodoba B: Pospravljanje stanovanja (Merge sort)
- Ne moreš pospraviti celega naenkrat
- **Razdelitev**: vsaki osebi dodelim eno sobo
- **Vladanje**: vsak pospravi svojo sobo
- **Združevanje**: ko so sobe urejene, urediš prehode med sobami
- Rekurenca: $T(n) = 2T(n/2) + n$ → $\Theta(n \log n)$

### Pripodoba C: Vojaška hierarhija (splošna DV)
- General dobi ukaz
- Razdeli med 2 polkovnika (**a = 2**)
- Vsak polkovnik pokrije polovico (**n/b = n/2**)
- Ob združevanju morajo poslati poročilo (**f(n)**)

### Pripodoba D: Karatsuba (trik z "manj množenj")
Najprej: množenje dveh $n$-bitnih števil = $n^2$ operacij (šola).  
Karatsuba: namesto 4 množenj podrazdelkov, uporabi **3** (algebrski trik).
- Rekurenca: $T(n) = 3T(n/2) + n$ → $\Theta(n^{1.585})$
- **Pripodoba**: kot bi tri ljudi nosilo paket namesto štiri — nekoliko se pomaga, a ne veliko

### Pripodoba E: Raziskovalec in zemljevid (rekurzijsko drevo)
```
                  T(n)
                 /    \
              T(n/2) T(n/2)        ← nivo 1: skupaj 2 × (n/2) = n
             / \      / \
          T(n/4) ...              ← nivo 2: skupaj 4 × (n/4) = n
             ...                  ← ...
       T(1) T(1) ... T(1)         ← nivo log n: n × 1 = n
```
Vsak nivo: **skupno delo = n**. Globina drevesa: $\log n$. Skupaj: $n \log n$.

---

## 4. Preslikave v druge domene

| Domena | Primer |
|---|---|
| **MapReduce (Google)** | Map = razdeli, Reduce = združi |
| **Funkcijsko programiranje** | Rekurzija + pattern matching |
| **UI frameworks** | Komponente: vsaka komponenta renderja sebe + svoje otroke |
| **Procesorski paralelizem** | Rekurzivni forki niti |
| **Fraktali (Mandelbrot)** | Sama struktura je self-similar |
| **Strassenovo množenje matrik** | 7 množenj namesto 8 za $\Theta(n^{2.807})$ |

---

## 5. Formalno jedro: Master theorem

$$T(n) = a \cdot T(n/b) + f(n)$$

Primerjaj $f(n)$ z $n^{\log_b a}$ (= "delo listov drevesa"):

| Primer | Pogoj | Rezultat |
|---|---|---|
| **1** (dominirajo listi) | $f(n) = O(n^{\log_b a - \epsilon})$ | $T(n) = \Theta(n^{\log_b a})$ |
| **2** (enakovredno) | $f(n) = \Theta(n^{\log_b a})$ | $T(n) = \Theta(n^{\log_b a} \log n)$ |
| **3** (dominira koren) | $f(n) = \Omega(n^{\log_b a + \epsilon})$ + regularnost | $T(n) = \Theta(f(n))$ |

**Mnemotehnika**: vprašaj se "kdo dela več — listi ali notranji nivoji?"
- Listi dominirajo → primer 1
- Vsi delajo enako → primer 2 (enakovredno = obkroži z $\log n$)
- Koren dela največ → primer 3

---

## 6. Mentalno orodje: hitra analiza

1. **Preberi $a$, $b$**: "koliko podproblemov" × "kako velik je vsak"
2. **Izračunaj $n^{\log_b a}$** (število listov drevesa)
3. **Primerjaj s $f(n)$**
4. **Izberi primer**

**Primer za vajo**: $T(n) = 4T(n/2) + n^2$
- $n^{\log_2 4} = n^2$
- $f(n) = n^2 = \Theta(n^2)$
- → **Primer 2**, rezultat $\Theta(n^2 \log n)$

---

## 7. Naloge

### Naloga 1
$T(n) = 9T(n/3) + n$. Zahtevnost?

<details>
<summary>Rešitev</summary>

$n^{\log_3 9} = n^2$. $f(n) = n < n^2$. **Primer 1** → $\Theta(n^2)$.
</details>

### Naloga 2
$T(n) = 2T(n/2) + n \log n$. Zahtevnost?

<details>
<summary>Rešitev</summary>

$n^{\log_2 2} = n$. $f(n) = n \log n$. Razlika je **logaritemska, ne polinomska** → master theorem **ne velja**.  
Rezultat (z drugo analizo): $\Theta(n \log^2 n)$.
</details>

### Naloga 3
Karatsuba: $T(n) = 3T(n/2) + n$. Zakaj je asimptotsko boljši od šolskega množenja?

<details>
<summary>Rešitev</summary>

$n^{\log_2 3} \approx n^{1.585}$. $f(n) = n < n^{1.585}$ → **Primer 1** → $\Theta(n^{1.585})$.  
Šolsko množenje je $\Theta(n^2)$. $n^{1.585} < n^2$ za vse dovolj velike $n$.
</details>

### Naloga 4 (substitucija)
Dokaži, da $T(n) = T(n-1) + n$ je $\Theta(n^2)$ z substitucijo.

<details>
<summary>Rešitev</summary>

Ugibam $T(n) \leq cn^2$. Induktivno:
$T(n) = T(n-1) + n \leq c(n-1)^2 + n = cn^2 - 2cn + c + n$  
Za $c \geq 1$: $-2cn + c + n \leq 0$, ko $n \geq 1$.
</details>

### Naloga 5
**Razmisli**: zakaj rekurzija $T(n) = T(n/2) + T(n/3) + n$ ne ustreza master izreku?

<details>
<summary>Rešitev</summary>

Master izrek zahteva en sam $b$. Tu imamo različna $b$ za različne podprobleme → drevo ni uravnoteženo.  
(Mimogrede: zahtevnost je $\Theta(n)$, ker geometrijska vrsta konvergira.)
</details>

---

## 8. Preveri sam(a) sebe

1. Kaj pomenijo $a$, $b$, $f(n)$?
2. Kdaj master izrek NE deluje?
3. Zakaj ima merge sort $\Theta(n \log n)$ in ne $\Theta(n^2)$?
4. Kaj je bistvo Karatsubovega trika?
5. Naštej 3 algoritme DV in njihove rekurence.

---

## 9. Najpogostejše pasti

- **Napačno branje $a$ in $b$** — $a$ = koliko klicev, $b$ = za koliko manjši problem
- **Uporaba master izreka, ko razlika ni polinomska** ($f(n) = n/\log n$ → ne deluje)
- **Pozabljanje ne-rekurzivnega dela** $f(n)$
- **Pozabljanje baznega primera** pri programiranju rekurzij

---

## 10. Povezave

- [[APS2-Deli_in_vladaj]] — referenca
- [[Divide_and_conquer]] — konceptualni pregled
- Prejšnji vodič: [[guide-01-Racunska_zahtevnost]]
- Naslednji vodič: [[guide-03-Amortizirana_casovna_zahtevnost]]
