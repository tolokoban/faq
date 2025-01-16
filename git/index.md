# GIT

## Rebase

Accepter les mofications de la branche sur laquelle on rebase (`target-branch`) :

```sh
git rebase -X theirs target-branch
```

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
