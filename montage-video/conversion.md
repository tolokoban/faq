# Montage Vidéo / Conversion de fichiers

Les scripts suivants utilisent [ffmpeg](https://ffmpeg.org/ffmpeg.html) v4.3.2

## Convertir en Motion JPEG pour les logiciels de montage vidéo

```bash
ffmpeg -i input.mp4 -c:v mjpeg -q:v 3 output.mov
```

La qualité est contrôllée par l'option `-q:v 3`. __2__ étant la qualité optimale et __31__ la pire.
