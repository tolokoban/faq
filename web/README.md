# Web

## Cloner un site web

```bash
wget --mirror --page-requisites --html-extension --convert-links https://my-site.com
```

Quand toutes les pages, images et autre resources sont téléchargées,
**wget** repasse sur toutes les pages et modifie les liens pour qu'ils
pointent sur les fichiers locaux.
