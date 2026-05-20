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

## Définitions de **Ours / Mine** et **Theirs**

Dans un rebase de `fork` sur `main` (`git rebase main`), Git va :

1. Se placer dans la branche `main` qu'il appelle **Ours** / **Mine**.
2. Appliquer les commits de `fork` qu'il appelle **Theirs**.
