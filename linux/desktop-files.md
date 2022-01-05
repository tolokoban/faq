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
Exec=/home/tolokoban/Programs/Krita/krita-5.0.0-x86_64.appimage
Path=Exec=/home/tolokoban/Programs/Krita/
```

On peut désormais **installer** ce fichier en créant le lien suivant :
```bash
ln -s ~/Programs/Krita/org.krita.Krita.desktop ~/.local/share/applications/org.krita.Krita.desktop
```

## Icône

La variable d'environnement `$XDG_DATA_DIRS` contient la liste des répertoires dans lesquels se trouvent les icônes système.
Par exemple, si cette variable contient `/usr/share/ubuntu` alors le système va chercher l'icône dans le répertoire `/usr/share/ubuntu/icons`.

Cette ligne de commande **bash** donne la liste de tous les répertoires d'icônes du système:
```bash
readarray -d ':' -t array <<< "$XDG_DATA_DIRS"; for path in "${array[@]}"; do if [ -d "${path}/icons" ]; then echo "${path}icons"; fi; done
```

Pour savoir oú placer les icônes en fonction du theme, voir ici: https://specifications.freedesktop.org/icon-theme-spec/icon-theme-spec-latest.html

