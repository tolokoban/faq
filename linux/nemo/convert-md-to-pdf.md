# Add a "Convert to PDF" context menu for Markdown files in Nemo 6.6.3

## 1. Install the requirements

| Package               | Why it's needed                                   |
|-----------------------|---------------------------------------------------|
| `pandoc`              | Converts Markdown to PDF                          |
| `texlive-xetex`       | Provides `xelatex`, the PDF engine (handles UTF-8 and accents) |
| `texlive-lang-french` | French hyphenation and typography (`-V lang=fr`)  |
| `texlive-fonts-recommended` | Default fonts (Latin Modern)                |
| `libnotify-bin`       | `notify-send`, to show success or error pop-ups   |

```bash
sudo apt update
sudo apt install pandoc texlive-xetex texlive-lang-french texlive-fonts-recommended libnotify-bin
```

Check the installation:

```bash
pandoc --version && xelatex --version
```

## 2. Create the conversion script

Create the file `~/.local/share/nemo/actions/md2pdf.sh`:

```bash
#!/usr/bin/env bash
# Convert each selected .md file into a .pdf file with the same name.
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
chmod +x ~/.local/share/nemo/actions/md2pdf.sh
```

## 3. Create the Nemo action

Create the file `~/.local/share/nemo/actions/md2pdf.nemo_action`
(the file name must end with `.nemo_action`):

```ini
[Nemo Action]
Name=Convert to PDF
Comment=Convert the selected Markdown file(s) to PDF with pandoc
Exec=<md2pdf.sh %F>
Icon-Name=application-pdf
Selection=notnone
Extensions=md;
Quote=double
Dependencies=pandoc;xelatex;
```

What each key does:

- `Exec=<md2pdf.sh %F>`: the angle brackets mean the script is looked up in the
  same folder as the action. `%F` is replaced by the full paths of the selected files.
- `Selection=notnone`: the menu works for one or more selected files.
- `Extensions=md;`: the menu appears only if **all** selected files end in `.md`.
- `Quote=double`: file paths that contain spaces are passed correctly.
- `Dependencies=pandoc;xelatex;`: the menu is hidden if either program is missing.

## 4. Activate and test

1. Nemo picks up new actions automatically. If the menu doesn't appear, restart Nemo:
   `nemo -q`, then open Nemo again.
2. Make sure the action is enabled in **Edit → Preferences → Plugins → Actions**.
3. Right-click a `.md` file and choose **Convert to PDF**. `my-file.pdf` is
   created next to `my-file.md`, and a notification confirms the result.

> **Tip:** if the conversion fails, the error notification shows pandoc's
> message. A common cause is an image path that pandoc can't find.
