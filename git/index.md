# GIT

## Rebase

Supposons que l'on soit sur la branch `fork` et que l'on veuille rebaser sur `main`.
En cas de conflits, on peut vouloir deux stratégies :

1. Préférer les modifications de `fork` (__incoming__): `git rebase -X theirs main`
2. Préférer les modifications de `main` (__current__): `git rebase -X ours main`

Avant de faire un rebase, on doit souvent changer de branche, faire un pull, puis revenir sur notre branche.
Voici un [script](./rebase.sh) qui permet de faire ça facilement.

## Big squash avant rebase

Pour connaitre le commit commun entre notre branche et la branch `main`:

```bash
git merge-base main HEAD
```

On peut alor afficher tous les commits depuis ce dernier:

```bash
git log --oneline 839b6e7..HEAD
```

On peut alors faire un __soft rest__ sur le commit commun.
Puis un commit unique:

```bash
git reset --soft 839b6e7
git commit -m "Fix missing somas, circuit viewer performance, controllable timeline, minimize button"
```

Le rebase n'aura maintenant qu'un seul commit à vérifier pour les conflits.

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
