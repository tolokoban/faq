# Squash

Pour connaitre le commit commun entre notre branche et la branch `main`:

```bash
git merge-base main HEAD
```

Pour afficher tous les commits depuis ce dernier:

```bash
git log --oneline 839b6e7..HEAD
```

On peut alors faire un __soft rest__ sur le commit commun.
Puis un commit unique:

```bash
git reset --soft 839b6e7
git commit -m "Fix missing somas, circuit viewer performance, controllable timeline, minimize button"
```
