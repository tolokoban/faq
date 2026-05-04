# GIT

## Rebase

Supposons que l'on soit sur la branch `fork` et que l'on veuille rebaser sur `main`.

Avant de faire un rebase, on doit souvent changer de branche, faire un pull, puis revenir sur notre branche.
Voici un [script](./rebase.sh) qui permet de faire ça facilement.

### Résolution automatique de conflets

En cas de conflits, on peut vouloir deux stratégies :

1. Préférer les modifications de `fork` (__incoming__): `git rebase -X theirs main`
2. Préférer les modifications de `main` (__current__): `git rebase -X ours main`

### Squash

S'il y a trop de commits qui divergent, le rebase peut etre long et on peut devoir résourdre des conflist pour chaque commit, ce qui est long.
Une technique est de squasher tous les commits de notre branche `fork`.

On recherche d'abord le branche commune à `fork` et `main`:

```sh
git merge base main HEAD
```

Avec le commit (<COMMIT>) récupéré, on peut maintenant squasher tous les commits de `fork` au dela de <COMMIT>:

```sh
git reset --soft <COMMIT>
git add .
git commit -am "Blablabla"
```

### Définitions de **Ours / Mine** et **Theirs**

Dans un rebase, Git se place dans la branche `main` qu'il appelle **Ours** / **Mine** et va appliquer les commits de `fork` qu'il appelle **Theirs**.


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

## Syntaxe avec 2 ou 3 points

### git log (and rev-list)

- `A..B` — commits reachable from B but **not** from A. Think of it as "what's in B that's not in A" (equivalent to `^A B`).
- `A...B` — commits reachable from **either** A or B, but **not both** (symmetric difference).

```
      C---D---E  (B)
     /
A---B---F---G    (A)
```

- `A..B` → `C, D, E`
- `A...B` → `C, D, E, F, G`

### git diff

It's essentially reversed:

- `A..B` — diff between A and B directly (same as `git diff A B`).
- `A...B` — diff between the **merge base** of A and B, and B. In other words, "what did B change since it diverged from A?"

Using the same graph:
- `git diff A..B` → diff from G to E
- `git diff A...B` → diff from B (the fork point) to E

The `...` form in `git diff` is especially useful for reviewing what a branch actually changed, ignoring work that happened on the other branch since they diverged.
