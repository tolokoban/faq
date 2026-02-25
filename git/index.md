# GIT

## Rebase

Supposons que l'on soit sur la branch `fork` et que l'on veuille rebaser sur `main`.
En cas de conflits, on peut vouloir deux stratégies :

1. Préférer les modifications de `fork` (__incoming__): `git rebase -X theirs main`
2. Préférer les modifications de `main` (__current__): `git rebase -X ours main`

Avant de faire un rebase, on doit souvent changer de branche, faire un pull, puis revenir sur notre branche.
Voici un [script](./rebase.sh) qui permet de faire ça facilement.

## Get remote branches

Lister les branches distantes :

```sh
git branch -av
```

Et avec la branche voulue :

```sh
git fetch origin remote-name:local-name
git checkout local-name
```

## Commit commun à deux branches

```sh
git merge-base branch2 branch3
```

## Voir un fichier à un commit donné

```sh
git show c3007ccba33ecff0a2823f74af9ff3673ff1cb5f:src/components/neuron-viewer/hooks/electrodes.ts
```

## Void le diff d'un fichier avec un commit donné

```sh
git diff c3007ccba -- src/components/neuron-viewer/neuron-viewer-with-actions.module.css
```

## Les fichier qui ont changé depuis un commit donné

```sh
git diff c3007ccba33ecff0a2823f74af9ff3673ff1cb5f --name-only
```
