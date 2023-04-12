# Rechercher avancée de fichiers

Les 3 `package.json` les plus récemment modifiés.

```bash
find . -name 'package.json' \
   -not -path '*/node_modules/*' \
   -exec stat -c '%Y %n' {} \; \
   | sort -nr | awk 'NR==1,NR==3 {print $2}'
```

----

[Retour](index.md)
