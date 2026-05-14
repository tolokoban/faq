# Nautilus

## Ajouter des scripts

Le menu contextuel d'un fichier/dossier affiche une rubrique `Scripts` qui contient le nom des fichiers executable de ce répertoire:
`~/.local/share/nautilus/scripts/`

Exemple de script :
```python
#!/usr/bin/env python3
import os

def main():
    for path in os.getenv("NAUTILUS_SCRIPT_SELECTED_FILE_PATHS", "").splitlines():
        basename = os.path.splitext(path)[0]
        os.system(f"ffmpeg -i \"{path}\" -c:v libx264 -crf 23 -profile:v high -pix_fmt yuv420p -color_primaries 1 -color_trc 1 -colorspace 1 -movflags +faststart -an \"{basename}.web.mp4\"""")

if __name__ == '__main__':
    main()
```

Les scripts utilisent certaines variables d'environnement pour savoir ce qui est sélectionné dans Nautilus.
* **NAUTILUS_SCRIPT_SELECTED_FILE_PATHS** : liste des chemins complets des fichiers sélectionnés, séparés par des sauts de ligne.
* **NAUTILUS_SCRIPT_SELECTED_URIS** : idem, mais liste des URIs plutôt que des chemins.
* **NAUTILUS_SCRIPT_CURRENT_URI** : URI du répertoire courant.
* **NAUTILUS_SCRIPT_WINDOW_GEOMETRY** : taille et position de Nautilus (ex: `1057x1006+2020+27`)
* 
Plus d'info ici : https://help.ubuntu.com/community/NautilusScriptsHowto
