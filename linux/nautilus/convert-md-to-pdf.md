# Add a "Convert to PDF" context menu for Markdown files in Nautilus (GNOME Files)

Works with Nautilus 43 and later (Ubuntu 22.10+, Debian 12+, Fedora 37+),
and also with older 3.x versions.

## 1. Install the requirements

| Package                     | Why it's needed                                  |
|-----------------------------|--------------------------------------------------|
| `pandoc`                    | Converts Markdown to PDF                         |
| `texlive-xetex`             | Provides `xelatex`, the PDF engine (handles UTF-8 and accents) |
| `texlive-lang-french`       | French hyphenation and typography (`-V lang=fr`) |
| `texlive-fonts-recommended` | Default fonts (Latin Modern)                     |
| `libnotify-bin`             | `notify-send`, to show success or error pop-ups  |
| `python3-nautilus`          | Lets Nautilus load Python extensions             |

```bash
sudo apt update
sudo apt install pandoc texlive-xetex texlive-lang-french texlive-fonts-recommended \
                 libnotify-bin python3-nautilus
```

(On Fedora the binding is called `nautilus-python`, and on Arch it's `python-nautilus`.)

## 2. Create the conversion script

Create the file `~/.local/bin/md2pdf.sh`:

```bash
#!/usr/bin/env bash
# Convert each .md file given as an argument into a .pdf file with the same name.
for f in "$@"; do
  dir="$(dirname "$f")"
  out="${f%.*}.pdf"
  # Run from the file's folder so that relative image paths resolve.
  if err=$(cd "$dir" && pandoc "$f" -o "$out" \
             --pdf-engine=xelatex -V lang=fr -V geometry:margin=2cm 2>&1); then
    notify-send "PDF created" "$(basename "$out")"
  else
    notify-send -u critical "PDF conversion failed" "$err"
  fi
done
```

Make it executable:

```bash
mkdir -p ~/.local/bin
chmod +x ~/.local/bin/md2pdf.sh
```

## 3. Create the Nautilus extension

Create the file `~/.local/share/nautilus-python/extensions/md2pdf.py`:

```python
import os
import subprocess

from gi.repository import GObject, Nautilus

SCRIPT = os.path.expanduser("~/.local/bin/md2pdf.sh")


class MarkdownToPdf(GObject.GObject, Nautilus.MenuProvider):
    def get_file_items(self, *args):
        # Nautilus 43+ passes (files); older versions pass (window, files).
        files = args[-1]
        # Show the menu only if ALL selected items are local .md files.
        if not files or not all(
            f.get_uri_scheme() == "file" and f.get_name().lower().endswith(".md")
            for f in files
        ):
            return []

        item = Nautilus.MenuItem(
            name="MarkdownToPdf::convert",
            label="Convert to PDF",
            tip="Convert the selected Markdown file(s) to PDF with pandoc",
            icon="application-pdf",
        )
        item.connect("activate", self.convert, files)
        return [item]

    def convert(self, _menu, files):
        paths = [f.get_location().get_path() for f in files]
        subprocess.Popen([SCRIPT, *paths])
```

The folder `~/.local/share/nautilus-python/extensions/` may not exist yet. Create it first:

```bash
mkdir -p ~/.local/share/nautilus-python/extensions
```

## 4. Activate and test

1. Restart Nautilus: `nautilus -q`, then open it again.
2. Right-click a `.md` file and choose **Convert to PDF**. `my-file.pdf` is
   created next to `my-file.md`, and a notification confirms the result.

**If the menu doesn't appear**, start Nautilus from a terminal to see Python errors:

```bash
nautilus -q
NAUTILUS_PYTHON_DEBUG=misc nautilus
```

> **Simpler alternative (no extension):** copy `md2pdf.sh` into
> `~/.local/share/nautilus/scripts/`. It then shows up under
> **right-click → Scripts → md2pdf.sh** for every file, not only `.md` files,
> and the selected paths come from `$NAUTILUS_SCRIPT_SELECTED_FILE_PATHS`
> instead of `"$@"`.
