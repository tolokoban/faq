# Copier un répertoire, mais pas tout

```bash
rsync -ah --progress --exclude={'node_modules/',''} src/ dst/
```
