# Copier un répertoire, mais pas tout

```bash
rsync -ahP --exclude={'node_modules','.git'} src/ dst/
```

* `-a` : copier les droits
* `-h` : format lisible par un humain
* `-P` : afficher la progression pour les gros fichiers
