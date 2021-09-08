# Montage Vidéo / Conversion de fichiers

Les scripts suivants utilisent [ffmpeg](https://ffmpeg.org/ffmpeg.html) v4.3.2

## Convertir en Motion JPEG pour les logiciels de montage vidéo

```bash
ffmpeg -i input.mp4 -c:v mjpeg -q:v 3 output.mov
```

La qualité est contrôllée par l'option `-q:v 3`. __2__ étant la qualité optimale et __31__ la pire.

## Fichier léger pour le Web

```bash
ffmpeg -i input.mp4 -c:v libx264 -crf 23 -profile:v high -pix_fmt yuv420p -color_primaries 1 -color_trc 1 -colorspace 1 -movflags +faststart output.mp4
```

## Convertir une vidéo en GIF

```bash
ffmpeg -ss 30 -t 3 -i input.mp4 -vf "fps=10,scale=320:-1:flags=lanczos,split[s0][s1];[s0]palettegen[p];[s1][p]paletteuse" -loop 0 output.gif
```

* `-ss 30` : (optionel) Saute les 30 premières secondes.
* `-t 3` : (optionel) Utiliser uiquement 3 secondes de vidéo.
* [`fps=10`](https://ffmpeg.org/ffmpeg-filters.html#fps) : 10 images par secondes dans le GIF généré.
* [`scale=320`](https://ffmpeg.org/ffmpeg-filters.html#scale) : Redimensionner à 320 pixels de large tout en gardant l'aspect ratio.
* Les filtres [`palettegen`](https://ffmpeg.org/ffmpeg-filters.html#palettegen) et [`paletteuse`](https://ffmpeg.org/ffmpeg-filters.html#paletteuse) permette de choisir entre une palette globale, une palette par frame, une palette par différences, ...
* `-loop 0` : Boucler à l'infini. Une valeur non nulle de `n` va répéter la séquence `n+1` fois. Donc une valeur de `-1` va jouer une unique fois.


