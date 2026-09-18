# Installer des polices de caractères

Aller sur [Google Fonts](https://fonts.google.com), sélectionner la police, cliquer sur **Get Font**, puis sur **Download**.
Dézipper les fichiers dans `~/.local/share/fonts` puis mettre à jour le cache des polices :

```sh
fc-cache -f -v
```

On peut lister les polices reconnues par le système avec :

```sh
fc-list
```
