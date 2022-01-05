# Créer une icône pour lancer une application

Supposons qu'on veuille créer une icône pour l'application Krita dont l'exécutable se trouve ici:
`/home/tolokoban/Programs/Krita/krita-5.0.0-x86_64.appimage`.

Il faut commencer par créer le fichier suivant: [`/home/tolokoban/Programs/Krita/org.krita.Krita.desktop`](https://specifications.freedesktop.org/desktop-entry-spec/latest/)

```bash
[Desktop Entry]
Type=Application

```
