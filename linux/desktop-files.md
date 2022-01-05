# Créer une icône pour lancer une application

Supposons qu'on veuille créer une icône pour l'application Krita dont l'exécutable se trouve ici:
`/home/tolokoban/Programs/Krita/krita-5.0.0-x86_64.appimage`.

Il faut commencer par créer le fichier suivant: [`/home/tolokoban/Programs/Krita/org.krita.Krita.desktop`](https://specifications.freedesktop.org/desktop-entry-spec/latest/)

```bash
[Desktop Entry]
Type=Application
Version=1.5
Name=Krita
GenericName=Digital Painting Software
Icon=/home/tolokoban/Programs/Krita/krita-icon.png
```

## Icône

La variable d'environnement `$XDG_DATA_DIRS` contient la liste des répertoires dans lesquels se trouvent les icônes.
Par exemple, si cette variable contient `/usr/share/ubuntu` alors il y a un répertoire `/usr/share/ubuntu/icons`.
