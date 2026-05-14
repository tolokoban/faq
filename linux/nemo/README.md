# Nemo

## Ajouter des scripts

Le menu contextuel d'un fichier/dossier affiche une rubrique `Scripts` qui contient le nom des fichiers executable de ce répertoire :
`~/.local/share/nemo/scripts/`

Exemple de script :

```python
#!/usr/bin/env python3
import os

def main():
    for path in os.getenv("NEMO_SCRIPT_SELECTED_FILE_PATHS", "").splitlines():
        basename = os.path.splitext(path)[0]
        os.system(f"ffmpeg -i \"{path}\" -c:v libx264 -crf 23 -profile:v high -pix_fmt yuv420p -color_primaries 1 -color_trc 1 -colorspace 1 -movflags +faststart -an \"{basename}.web.mp4\"")

if __name__ == '__main__':
    main()
```

Les scripts utilisent certaines variables d'environnement pour savoir ce qui est sélectionné dans Nemo.

* **NEMO_SCRIPT_SELECTED_FILE_PATHS** : liste des chemins complets des fichiers sélectionnés, séparés par des sauts de ligne.
* **NEMO_SCRIPT_SELECTED_URIS** : idem, mais liste des URIs plutôt que des chemins.
* **NEMO_SCRIPT_CURRENT_URI** : URI du répertoire courant.
* **NEMO_SCRIPT_WINDOW_GEOMETRY** : taille et position de Nemo (ex: `1057x1006+2020+27`)

## Ajouter des actions personnalisées

Nemo supporte aussi des actions via des fichiers `.nemo_action` placés dans :
`~/.local/share/nemo/actions/`

### Exemple pour un seul fichier

`~/.local/share/nemo/actions/convert-mp4.nemo_action`

```ini
[Nemo Action]
Name=Convertir en MP4
Comment=Convertir la vidéo en MP4 avec ffmpeg
Exec=ffmpeg -i %F -c:v libx264 -crf 23 -an %F.web.mp4
Selection=s
Extensions=mkv;avi;mov;webm
```

### Exemple pour plusieurs fichiers sélectionnés

`~/.local/share/nemo/actions/convert-mp4-multi.nemo_action`

```ini
[Nemo Action]
Name=Convertir en MP4 (multiple)
Comment=Convertir les vidéos sélectionnées en MP4
Exec=<convert-mp4.sh %F>
Selection=m
Extensions=mkv;avi;mov;webm
```

La syntaxe `<script %F>` avec les chevrons permet de passer tous les fichiers sélectionnés en arguments au script.
Le script helper (`~/.local/share/nemo/actions/convert-mp4.sh`, doit être exécutable) :

```bash
#!/bin/bash
for f in "$@"; do
    basename="${f%.*}"
    ffmpeg -i "$f" -c:v libx264 -crf 23 -an "${basename}.web.mp4"
done
```

### Champs utiles

* **Name** : nom affiché dans le menu contextuel.
* **Exec** : commande à exécuter (`%F` = chemin du fichier sélectionné, `%U` = URI).
* **Selection** : `s` (un seul fichier), `m` (multiple), `any`, `none`.
* **Extensions** : extensions de fichiers pour lesquelles l'action apparaît (séparées par `;`).
* **Mimetypes** : alternative aux extensions, filtrer par type MIME.

Documentation : <https://github.com/linuxmint/nemo/wiki/Nemo-Actions>
