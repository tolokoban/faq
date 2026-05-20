# Afficher la liste des fichies ignorés par Git

```bash
git ls-files --others --ignored --exclude-standard
```

Ou, si vous ne voulez que les répertoires :

```bash
git ls-files --others --ignored --exclude-standard --directory
```
