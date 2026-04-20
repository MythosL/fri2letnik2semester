---
excalidraw-plugin: parsed
tags: [excalidraw, aps2, deli-in-vladaj, karatsuba]
excalidraw-open-md: true
---
==⚫==

# Text Elements

Karatsubov trik: 4 → 3 množenja

Šolsko množenje:
a = 10^(n/2)·a₁ + a₀
b = 10^(n/2)·b₁ + b₀
a·b = 10ⁿ·(a₁b₁) + 10^(n/2)·(a₁b₀ + a₀b₁) + a₀b₀
     štiri množenja: a₁b₁, a₁b₀, a₀b₁, a₀b₀  →  T(n)=4T(n/2)+Θ(n) = Θ(n²)

Karatsubov trik (tri množenja):
c₂ = a₁b₁
c₀ = a₀b₀
c₁ = (a₁+a₀)(b₁+b₀) − c₂ − c₀     ← namesto a₁b₀+a₀b₁

a·b = 10ⁿc₂ + 10^(n/2)c₁ + c₀

Rekurenca: T(n) = 3T(n/2) + Θ(n)
Krovni izrek: a=3, b=2, d=1 → a > b^d → Θ(n^(log₂ 3)) ≈ Θ(n^1.585)

## Namig za risanje

- Levo: klasični štiri-produktni pristop z drevesom
- Desno: Karatsubov trik z obroniranim "c₁"
- Puščica: "En produkt prihranjen"
- Spodaj: rekurenca in rezultat

%%
# Drawing
```json
{
	"type": "excalidraw",
	"version": 2,
	"source": "https://github.com/zsviczian/obsidian-excalidraw-plugin/releases/tag/2.0.0",
	"elements": [],
	"appState": {
		"theme": "light",
		"viewBackgroundColor": "#ffffff",
		"gridSize": null
	},
	"files": {}
}
```
%%
