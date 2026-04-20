---
excalidraw-plugin: parsed
tags: [excalidraw, aps2, deli-in-vladaj]
excalidraw-open-md: true
---
==⚫==

# Text Elements

Rekurzijsko drevo za T(n) = a·T(n/b) + f(n)

Nivo 0:  T(n)                                     delo = f(n)
          ↓ a vej
Nivo 1:  T(n/b) T(n/b) ... (a klicev)             delo = a·f(n/b)
          ↓ a vej
Nivo 2:  T(n/b²) ... (a² klicev)                  delo = a²·f(n/b²)
          ...
Nivo log_b n:  T(1) T(1) ... (n^(log_b a) listov)  delo = Θ(n^(log_b a))

Vsota po nivojih: primerjava a z b^d (f(n) = Θ(n^d))
- a > b^d  →  Primer 1:  Θ(n^(log_b a))  [listi dominirajo]
- a = b^d  →  Primer 2:  Θ(n^d log n)    [vsi nivoji enakovredni]
- a < b^d  →  Primer 3:  Θ(n^d)          [koren dominira]

## Namig za risanje

- Trikotnik z razvejanostjo a na vsakem nivoju
- Ob vsakem nivoju zapiši delo
- Obarvaj listi (zadnji nivo) in notranji nivoji drugače
- Ob strani 3 puščice: "Primer 1", "Primer 2", "Primer 3"

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
