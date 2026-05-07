# Montage Video

* [Conversions de fichier](conversion.md)
* [Decouper un morceau](cut.md)
* Vidéo à partir d'images: `ffmpeg -framerate 24 -i frame-%4d.png -r 25 -pix_fmt yuv420p out.mp4`
* Images à partie d'une vidéo: `ffmpeg -i salon.mp4 -qscale:v 2 -vsync 0 salon-%04d.jpg`

Avec Kubuntu, vous pouvez copier le contenu de l'archive suivants dans `~/.local/share/kio`: [servicemenus](./servicemenus.tar.gz)
