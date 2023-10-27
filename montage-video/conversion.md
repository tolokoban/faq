# Montage Vidéo / Conversion de fichiers

Les scripts suivants utilisent [ffmpeg](https://ffmpeg.org/ffmpeg.html) v4.3.2

## Convertir en Motion JPEG pour les logiciels de montage vidéo

```bash
ffmpeg -i input.mp4 -c:v mjpeg -q:v 3 output.mov
```

La qualité est contrôllée par l'option `-q:v 3`. __2__ étant la qualité optimale et __31__ la pire.

## Fichier léger pour le Web

```bash
ffmpeg -i input.mp4 -c:v libx264 -vf "pad=ceil(iw/2)*2:ceil(ih/2)*2" -crf 23 -profile:v high -pix_fmt yuv420p -color_primaries 1 -color_trc 1 -colorspace 1 -movflags +faststart output.mp4
```

### Menu action pour dolphin

Créer ce fichier: `~/.local/share/kio/servicemenus/small-video.desktop`

```
[Desktop Entry]
Type=Service
MimeType=video/*;
Actions=makeSmallForInternet

[Desktop Action makeSmallForInternet]
Name=Make small video for the web
Name[fr]=Vidéo légère pour le web
Icon=video
Exec=ffmpeg -i %u -c:v libx264 -vf "pad=ceil(iw/2)*2:ceil(ih/2)*2" -crf 23 -profile:v high -pix_fmt yuv420p -color_primaries 1 -color_trc 1 -colorspace 1 -movflags +faststart %u.web.mp4
```

## Convertir une vidéo en GIF

```bash
ffmpeg -ss 30 -t 3 -i input.mp4 -pix_fmt rgb24 -r 8 -loop 0 output.gif
```

* `-ss 30` : (optionel) Saute les 30 premières secondes.
* `-t 3` : (optionel) Utiliser uiquement 3 secondes de vidéo.
* `r=8` : 8 images par secondes dans le GIF généré.


