# Počítání slabik ve slově v češtině
## Algoritmus (Martina Koppová)
Skript na počítání slabik využívá pravidleného systému, který v češtině funguje na základě sonority hlásek.[1] Lehce problematické by bylo přesné určování hranic slabik, ale vzhledem k tomu, že k našim účelům potřebujeme pouze prostý počet, můžeme nejistotu ohledně hranice pominout. Prosté spočítání samohlásek komplikují dva jevy, a to 

1. slabikotvorné souhlásky (neobsahují žádnou samohlásku, ale tvoří slabiku)
2. dvojhlásky (obsahují dvě samohlásky, ale tvoří pouze jednu slabiku). Prostě sloučit za sebou se vyskytující dvě souhlásky do jedné ovšem nejde kvůli následujícímu případu:
 2a. shluky dvou samohlásek na morfologickém švu, které naopak tvoří dvě slabiky (např. do'učit)

Skript tedy pracuje tak, že ve slově nejprve "odstraní" tyto speciální případy, a to tak, že shluky "au/eu/ou" zkontroluje, zda jejich první hláska není součástí řetězce vyjmenovaných předpon "o za na pře ne po pro do", pokud

1. nejsou, pak se určitě jedná o dvojhlásku a je celá dvojhláska nahrazena jedním počítacím znakem
2. jsou, pak nastává speciální případ, který nelze rozhodnout bez použití kontextu (rozdíl pro'udit [=provést procesem uzení] x proudit [=téct proudem]) - proto u těchto případů není jako výstup číslo, ale znak pro nutnost individuálního posouzení výzkumíkem.

U speciálních případů se slabikotvornými souhláskami se postupuje následovně: 
Skript vyhledá všechna "r" a "l", a pokud se bezprostředně vedle nich nevyskytuje samohláska, pak se jedná o slabikotvorné r/l, a je tedy nahrazeno počítacím znakem.

Nakonec jsou všechny zbývající samohlásky nahrazeny počítacími znaky a ty skript sečte a vypíše jejich počet. 

Příklady:
```
kolotoč -> k#l#t#č -> 3
traktor -> tr#kt#r -> 2
trvat -> t#v#t -> 2
loupe -> l#p# -> 2
doupě -> !!! (nutno rozhodnout)
doučit -> !!! (nutno rozhodnout)
```


[1] PALKOVÁ, Zdena. Fonetika a fonologie češtiny: s obecným úvodem do problematiky oboru. Praha: Karolinum, 1994. (str. 269-270)

## Implementace

V jazyce Perl. Vstupem je soubor, který má na každém řádku jedno slovo:
```
kolotoč
traktor
trvat
loupe
doupě
doučit
```

a výstupem je seznam počtů slabik a znaků 'X', pokud nelze pro dané slovo rozhodnout:
```
3
2
2
2
X
X
```
### Příklad spuštění
```
perl ./pocet_slabik.pl < sample_data.txt
```