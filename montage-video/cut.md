# Découper un morceau

```bash
ffmpeg -ss 3 -t 10 -i input.mp4 -c:v copy -c:a copy output.mkv
```

* `-ss 3`: Sauter les 3 premières secondes.
* `-t 10`: Garder 10 secondes.
