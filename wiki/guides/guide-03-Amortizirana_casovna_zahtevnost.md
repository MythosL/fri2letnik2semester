---
title: "Študijski vodič 03 – Amortizirana časovna zahtevnost"
tags: [aps2, vodic, ucenje, amortizacija]
type: study-guide
order: 3
last_updated: 2026-04-18
---

# Študijski vodič 03 – Amortizirana časovna zahtevnost

> Cilj: znati izbrati pravo metodo (agregatna / bančna / potencialna) za analizo zaporedja operacij.

## 1. Bistvo v enem stavku

**"Ne gledamo najhujšega primera ene operacije, ampak povprečje skozi celotno zaporedje."**

---

## 2. Intuicija – zakaj to potrebujemo

Najhuji scenarij posameznih operacij zna biti **pretiran**. Primer:
- **Dinamično polje**: `push` v 99.9 % primerov je $O(1)$. Le občasno, ko se polje napolni, se podvoji v $O(n)$.
- **Najhuji primer**: $O(n)$ → napačno!
- **Amortizirana cena**: $O(1)$ → prava zgodba.

Drage operacije **plačamo vnaprej** s poceni operacijami — in povprečje ostane nizko.

---

## 3. Ključne pripodobe

### Pripodoba A: Mesečna kartica vlaka
- Posamezna vožnja: 5 €
- Mesečna kartica: 50 € / 30 voženj ≈ 1,67 € na vožnjo
- **Amortizirana cena** = 1,67 €, tudi če nekateri dnevi "ne voziš" ali "voziš 5×"

### Pripodoba B: Pralni stroj (Multipop)
- Vsak dan mečeš eno oblačilo v koš (`push`)
- Ko je koš poln, sprožiš **veliko pranje** (`multipop`)
- Cena pranja = število oblačil, AMPAK: že plačano vsak dan s košem
- **Ključ**: ne moreš popniti več, kot si pushnil

### Pripodoba C: Bančni račun (accounting metoda)
- Pri vsakem `push` plačaš **3 €** (ne 1 €)
- 1 € gre za samo vstavljanje
- 2 € gre **v banko** (depozit)
- Ko pride `pop`, depozit pokrije stroške
- Dokler je saldo ≥ 0, si varno v $O(1)$ amortizirano

### Pripodoba D: Rezervoar vode (potencialna metoda)
- **Stanje** strukture = višina vode $\Phi(D)$
- **Dodaj** element → višina raste ("shranjuješ energijo")
- **Draga operacija** → višina pade ("poraba energije")
- Amortizirana cena = dejanska cena **+ sprememba višine**
- $\Phi(D_0) = 0$, vedno $\Phi(D_i) \geq 0$

### Pripodoba E: Selitev (dinamično polje)
- Stanuješ v stanovanju velikosti $k$
- Dodajaš pohištvo
- Ko je polno → se preseliš v **2×** večje
- Selitev je draga (premikaš vse), AMPAK: med selitvama si pridobil dovolj "mesecev najemnine"
- Povprečni strošek življenja je $O(1)$

---

## 4. Preslikave v druge domene

| Domena | Primer |
|---|---|
| **Redis rehashing** | Ko se `HashMap` napolni, se podvoji — ammortizirano $O(1)$ |
| **Python list.append** | CPython uporabi dinamično polje, ammortizirano $O(1)$ |
| **Git pack-files** | Majhne operacije, občasno velika reorganizacija |
| **Garbage collection** | Mala alokacija poceni, občasni GC drag → povprečno OK |
| **CPU cache** | "Prefetch" kot depozit za kasnejše branje |

---

## 5. Tri metode formalno

### Metoda 1: **Agregatna**
Izračunaj **skupno ceno** zaporedja $n$ operacij, deli z $n$.

$$\text{amortizirana cena} = \frac{\sum c_i}{n}$$

Primer: multipop — $n$ operacij skupaj $\leq 2n$ dela → $O(1)$ amortizirano.

### Metoda 2: **Bančna (accounting)**
Vsaki operaciji dodeli "pristojbino" $\hat{c}_i$, ki jo plačaš, tudi če dejansko stane manj. Razlika gre **v banko**.

**Zahteva**: banka nikoli ne sme biti negativna.

$$\sum_{i=1}^{n} \hat{c}_i \geq \sum_{i=1}^{n} c_i$$

### Metoda 3: **Potencialna**
Definiraj funkcijo $\Phi: D \to \mathbb{R}_{\geq 0}$ z $\Phi(D_0) = 0$.

$$\hat{c}_i = c_i + \Phi(D_i) - \Phi(D_{i-1})$$

**Zahteva**: $\Phi$ vedno $\geq 0$.

---

## 6. Mentalno orodje: "katero metodo izbrati?"

- **Agregatna**: ko je hitro videti skupno ceno (multipop, binarni števec)
- **Bančna**: ko znaš intuitivno dodeliti "pristojbine" različnim tipom operacij
- **Potencialna**: najmočnejša, uporabi, ko je stanje strukture spremenljivo (dinamično polje)

---

## 7. Trije kanonični primeri

### Multipop sklad
$$\Phi(D) = |S|$$

| Op | $c_i$ | $\Delta\Phi$ | $\hat{c}_i$ |
|---|---|---|---|
| push | 1 | +1 | 2 |
| pop | 1 | −1 | 0 |
| multipop($k$) | $k$ | $-k$ | 0 |

Vse $O(1)$ amortizirano.

### Dinamično polje
$$\Phi(D) = 2 \cdot \text{size} - \text{capacity}$$

- Push brez podvajanja: $\hat{c} = 1 + 2 = 3$
- Push s podvajanjem ($k$ kopij): $\hat{c} = (k+1) + (2 - k) = 3$

Vedno $O(1)$.

### Binarni števec
$$\Phi(D) = \text{št. enic}$$

Inkrement: popravi $t$ enic na 0, nato doda 1 eno.
- $c_i = t + 1$, $\Delta\Phi = 1 - t$
- $\hat{c}_i = 2 = O(1)$

---

## 8. Naloge

### Naloga 1
Imamo sklad, na katerem delamo 100 `push` in 50 `multipop` operacij. **Brez** amortizirane analize bi bilo najhuje $100 + 50 \cdot 100 = 5100$. Kaj pove amortizirana analiza?

<details>
<summary>Rešitev</summary>

Skupno delo $\leq 2 \cdot$ število push = $200$. Torej realno dela je največ **200**, ne 5100.
</details>

### Naloga 2
Zasnuj potencialno funkcijo za sklad, ki omogoči poceni `multipush` operacijo (dodaj $k$ elementov naenkrat).

<details>
<summary>Rešitev</summary>

Isti $\Phi(D) = |S|$.  
multipush($k$): $c = k$, $\Delta\Phi = +k$, $\hat{c} = 2k = O(k)$.  
Povprečno na element: $O(1)$.
</details>

### Naloga 3
Zakaj ne deluje dinamično polje, če povečujemo za **konstanto** $+c$ namesto podvajanja?

<details>
<summary>Rešitev</summary>

Z $n$ pushi imamo $n/c$ premikov, vsakič prekopiraš povprečno $n/2$ elementov.  
Skupaj $\Theta(n^2 / c) = \Theta(n^2)$. Amortizirano **$O(n)$ na push** — slabo!  
Podvajanje da geometrijsko vsoto, ki konvergira v $O(n)$ skupaj → $O(1)$ na push.
</details>

### Naloga 4
Dokaži z bančno metodo: inkrement binarnega števca je $O(1)$ amortizirano.

<details>
<summary>Rešitev</summary>

Pristojbina za vsak nov prehod iz 0 → 1: **2 enoti**.  
- 1 enota plača postavitev bita na 1 zdaj
- 1 enota se shrani **na biti 1**, za kasnejšo brisanje
Ko bit pade 1 → 0, banka plača to brisanje.  
Saldo nikoli negativen. Vsak inkrement plača samo enkratno pristojbino (en nov 1) → $O(1)$.
</details>

### Naloga 5 (sinteza)
**Razmisli**: zakaj ne rečemo, da je dinamično polje "povprečni primer $O(1)$"?

<details>
<summary>Rešitev</summary>

Povprečni primer pomeni **statistično povprečje** preko naključnih vhodov.  
Amortizirana analiza je **najhuji scenarij za zaporedje** — nobeno naključje, velja **vedno**. Močnejša trditev.
</details>

---

## 9. Preveri sam(a) sebe

1. Kaj zahteva potencialna funkcija? (3 pogoji)
2. V katerem primeru je agregatna metoda premalo?
3. Pokaži z eno vrstico, zakaj multipop je $O(1)$ amortizirano.
4. Zakaj je amortizirana cena "zgornja meja" realne cene?
5. Opiši primer, kjer je ammortizirano $O(1)$, ampak najhuji primer $O(n)$.

---

## 10. Najpogostejše pasti

- **Potencial postane negativen** — invarianta zlomljena, analiza neveljavna
- **Pozabljanje $\Phi(D_0) = 0$** — ali vsaj majhna začetna vrednost
- **Mešanje amortizirane in povprečne analize** — niso isto!
- **Dvojno štetje dela** — enkrat pri pristojbini, enkrat pri direktnem
- **Premajhna pristojbina** → banka gre v minus

---

## 11. Povezave

- [[APS2-Amortizirana_casovna_zahtevnost]] — referenca
- [[Potencialna_funkcija]] — poglobljen pregled metode
- Prejšnji vodič: [[guide-02-Deli_in_vladaj]]
- Naslednji vodič: [[guide-04-Pozresni_algoritmi]] *(še ne napisan)*
