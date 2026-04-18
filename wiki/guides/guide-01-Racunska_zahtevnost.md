---
title: "Študijski vodič 01 – Računska zahtevnost"
tags: [aps2, vodic, ucenje, zahtevnost, np-polnost]
type: study-guide
order: 1
last_updated: 2026-04-18
---

# Študijski vodič 01 – Računska zahtevnost

> Cilj: po tem vodiču boš znal pogledati problem in reči "to je P / NP / NP-poln" ter vedel, kako to dokazati.

## 1. Bistvo v enem stavku

**"Kako merimo, ali je problem res težek, ali smo samo mi zaspani algoritmisti?"**

---

## 2. Intuicija – zakaj to sploh potrebujemo

Imaš dva problema:
- **Urejanje tisoč številk** — vsi vemo, O(n log n)
- **Najdi najkrajšo turo skozi 30 mest (TSP)** — hmm... nihče še ni našel hitrega algoritma

Vprašanje ni "ali je težek zame?", ampak **"ali obstaja sploh hiter algoritem?"**  
Teorija zahtevnosti je jezik, s katerim postavljamo to vprašanje formalno.

---

## 3. Ključne pripodobe

### Pripodoba A: Sudoku
- **Rešiti sudoku 25×25**: težko, potrebuje čas
- **Preveriti dano rešitev**: trivialno (samo preveriš vrstice/stolpce/bloke)
- → To je bistvo **NP**: "težko rešiti, lahko preveriti"

### Pripodoba B: Ključavnica s 1000 ključi
- **P**: ključi so oštevilčeni, veš sistem → najdeš v $\log n$ korakih
- **NP**: nisi oštevilčen, ampak če ti nekdo pokaže pravi ključ, v 1 sekundi vidiš
- **NP-poln**: ta ključavnica je "univerzalna" — če znaš odpreti, znaš vse druge

### Pripodoba C: Prevajanje (redukcija $A \leq_p B$)
> "Če znaš rešiti B, znaš tudi A — uporabi prevajalnik."

Kot: če znaš angleško in imaš Google Translate, znaš razumeti kitajščino. Redukcija = prevajalnik.

### Pripodoba D: Najtežje vprašanje na izpitu
NP-poln problem je "najtežje vprašanje" v razredu NP. Če rešiš TEGA, si rešil **VSE** v razredu — ker se vsi ostali reducirajo nanj.

---

## 4. Preslikave v druge domene

| Kje se pojavi | Kako |
|---|---|
| **Kriptografija (RSA)** | Faktorizacija velikih števil je težka (verjetno NP), množenje lahko (P). Cela spletna varnost stoji na tem. |
| **Bitcoin / PoW** | Proof-of-Work = reši NP problem, dokaz je majhen |
| **Logistika (DHL, UPS)** | TSP je NP-poln → uporabljajo **aproksimacije** |
| **Razporejanje urnikov** | Barvanje grafov = NP-polno |
| **Biologija (protein folding)** | NP-težek problem |

---

## 5. Formalni temelji (kar MORAŠ znati)

### Razredi

- **P** = problemi rešljivi v polinomskem času ($O(n^k)$)
- **NP** = problemi, pri katerih lahko **verificiraš** rešitev v polinomskem času (ob pomoči "certifikata")
- **NP-težak** = vsaj tako težek kot vsak NP problem
- **NP-poln** = NP-težak **IN** v NP hkrati

### Redukcija $A \leq_p B$

Funkcija $f$, izračunljiva v poly-času, taka da:
$$x \in A \iff f(x) \in B$$

**Zlato pravilo**: če boš dokazoval da je $X$ NP-poln, reduciraj **znan NP-poln problem na $X$** (ne obratno!).

### Cook-Levin

**SAT** (zadovoljljivost logičnih formul) je NP-poln. To je "matična" NP-polnost — vse ostale izhajajo iz nje.

---

## 6. Mentalno orodje: "Ali je v NP?"

Vprašaj se:
1. **Kaj bi bil "certifikat"?** (rešitev, ki jo lahko preveriš)
2. **Ali lahko preverim certifikat v $O(n^k)$?**

Primeri:
- Hamiltonov cikel → certifikat = zaporedje vozlišč → preveriš v $O(n)$ ✓
- TSP (odločitvena verzija) → certifikat = tura → preveriš vsoto ✓
- Šah (splošni n×n) → NI v NP (preverjanje zmagovalne strategije je eksponentno)

---

## 7. Naloge (reši, preden pogledaš rešitev)

### Naloga 1
**Problem**: "Ali ima dano število $n$ faktor $\leq k$?"  
**Vprašanje**: P ali NP?

<details>
<summary>Rešitev</summary>

V **NP** — certifikat je faktor $d$, preveriš z deljenjem v polinomskem času glede na dolžino $n$ (= število bitov).  
Ni znano, ali je v P.
</details>

### Naloga 2
**Problem**: "Ima graf $G$ neodvisno množico velikosti $\geq k$?"  
Reduciraj ga na **Clique**.

<details>
<summary>Rešitev</summary>

Komplementarni graf $\bar G$ ima klik velikosti $k$ natanko takrat, ko $G$ ima neodvisno množico velikosti $k$.  
Torej $f(G, k) = (\bar G, k)$. Izračun $\bar G$ je $O(V^2)$ → poly-čas. ✓
</details>

### Naloga 3
**Razmisli**: Zakaj je **pomembno**, da reduciraš *iz* znanega NP-polnega *v* nov problem, in ne obratno?

<details>
<summary>Rešitev</summary>

Če $A$ je NP-poln in $A \leq_p B$, to pomeni: "B je vsaj tako težek kot A". Ker je A že NP-težak, je tudi B.  
Obratna smer ($B \leq_p A$) ne pokaže ničesar — B bi lahko bil trivialno lahek, pa bi se vedno reduciral na težjega A.
</details>

### Naloga 4
Imamo problem **PARTITION**: "Ali lahko množico števil razdelimo na dve podmnožici z enako vsoto?"  
Kako bi **intuitivno** povedali, zakaj je to NP?

<details>
<summary>Rešitev</summary>

Certifikat = ena od dveh podmnožic. Preverim: seštejem elemente, primerjam s polovico celotne vsote. $O(n)$.  
→ V NP. (Dejansko je NP-poln, reducira se nanj Subset Sum.)
</details>

### Naloga 5 (sinteza)
**Naštej vsaj 5 NP-polnih problemov** in za vsakega v eni vrsti povej, kateri realni problem rešujejo.

<details>
<summary>Rešitev</summary>

- **SAT** — logično sklepanje, verifikacija vezij
- **TSP** — dostavni problemi (DHL)
- **Knapsack** — izbira naložb, priprava prtljage
- **Graph Coloring** — razporejanje urnikov, dodeljevanje frekvenc
- **Vertex Cover** — nameščanje kamer, nadzorovanje omrežja
- **Hamiltonov cikel** — načrtovanje ogledov, robotika
</details>

---

## 8. Preveri sam(a) sebe (aktivni priklic)

Brez pogledovanja odgovori:
1. Kaj je razlika med NP in NP-poln?
2. Kako dokažeš, da je nov problem $X$ NP-poln? (4 koraki)
3. Zakaj velja: "če $P = NP$, potem je cela kripto mrtva"?
4. Kaj pomeni "certifikat" v NP?
5. Ali je P podmnožica NP? Zakaj?

---

## 9. Najpogostejše pasti

- **Napačna smer redukcije** → dokaz je neveljaven
- **Mešanje NP-težak vs NP-poln** → NP-težak ni nujno v NP
- **Pozabljanje preveriti, da je $X \in NP$** → pokažeš samo težavnost, ne polnosti
- **Pozabiti, da je "$k$" del vhoda** → $O(2^k)$ ni poly, če je $k$ dela vhoda

---

## 10. Povezave

- [[APS2-Racunska_zahtevnost]] — referenca
- [[NP_polnost]] — globlji pregled teorije
- Naslednji vodič: [[guide-02-Deli_in_vladaj]]
