# Rebase

## Script utile

Supposons que l'on soit sur la branch `fork` et que l'on veuille rebaser sur `main`.

Avant de faire un rebase, on doit souvent changer de branche, faire un pull, puis revenir sur notre branche.
Voici un [script](./rebase.sh) qui permet de faire ça facilement.
Il permet même de faire un squash des commits de `fork` avant le rebase.

## Résolution automatique de conflits

En cas de conflits, on peut vouloir deux stratégies :

1. Préférer les modifications de `fork` (__incoming__): `git rebase -X theirs main`
2. Préférer les modifications de `main` (__current__): `git rebase -X ours main`
