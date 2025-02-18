# GIT

## Rebase

Supposons que l'on soit sur la branch `fork` et que l'on veuille rebaser sur `main`.
En cas de conflits, on peut vouloir deux stratégies :

1. Préférer les modifications de `fork` (__incoming__): `git rebase -X theirs main`
2. Préférer les modifications de `main` (__current__): `git rebase -X ours main`

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
