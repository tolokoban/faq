# Installer Linux Mint

Pour être le plus léger possible, on opte pour [l'environnement Xfce](https://www.linuxmint.com/download.php).

## Thunderbird

* [fabien.petitjean@free.fr](mailto:fabien.petitjean@free.fr) __fabien.petitjean__ imap.free.fr:993 (SSL/TLS) normal password
* [contact@tolokoban.org](mailto:contact@tolokoban.org) imap.ionos.fr:993 (SSL/TLS) normal password
* [contact@trail-passion.net](mailto:contact@trail-passion.net) ssl0.ovh.net (SSL/TLS) normal password

* SMTP `smtp.ionos.fr:587` STARTTLS __contact@tolokoban.org__
* SMTP `ssl0.ovh.net:465` SSL/TLS __contact@trail-passion.net__

## Clavier

Ajouter la touche _compose_ pour les claviers sans accent : Settings/Keyboard/Layout
![image](https://github.com/user-attachments/assets/01809496-e31a-4aaa-b534-7791ff494295)

## NodeJS (an more) version manager

Pour pouvoir gérer plusieurs languages (NodeJS, Rust, PHP, ...) nous utilison [asdf](https://github.com/asdf-vm/asdf).

```bash
sudo apt install curl git dirmngr gpg gawk
git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.14.1
```

Add this in your `~/.bashrc` file:

```
. "$HOME/.asdf/asdf.sh"
. "$HOME/.asdf/completions/asdf.bash"
```

Restart your terminal and intall plugins:

```bash
asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git
asdf list all nodejs
```

Install the version you like. For instance:

```bash
asdf install nodejs 20.17.0
asdf global nodejs 20.17.0
```

## Accéder à GitHub par SSH

Toute la doc est ici :  [connecting to GitHub using SSH keys](https://docs.github.com/en/authentication/connecting-to-github-with-ssh)

Créer une clef SSH comme ceci : `ssh-keygen -t ed25519 -C "your_email@example.com"`
Et protéger ses clefs comme ceci : `chmod 0700 ~/.ssh/*`

S'assurer d'avoir ceci dans le `~./bashrc` :

```bash
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/github
```
## Virer le Alt-click

Alt-click est utile dans Blender et Krita (au moins). Mais, par défaut, xfce l'utilise pour bouger les fenêtres.
Pour se débarasser de ce mécanisme, il faut ouvrir la config :

```bash
xfce4-settings-manager
```

Aller dans la section __settings editor__, tout en bas, puis choisir `xfwm4` dans la colonne __Channel__.

![image](https://github.com/user-attachments/assets/b79962a1-06a0-4bdd-a462-63fc1746dd83)

Éditer le champ `easy_click` et retirer le __Alt__.

![image](https://github.com/user-attachments/assets/050a92a9-a536-435b-a62a-6f4479b8e647)

## Trail-Passion

S'assurer d'avoir __docker__ : `sudo apt install docker.io docker-compose`

Pour ne pas avoir à utiliser `sudo` tout le temps :

```bash
sudo groupadd docker
sudo usermod -aG docker $USER
```

Tester avec cette commande : `docker run hello-world`

Ajouter cela dans le `~/.bashrc` :

```bash
export TRAILPASSION_DIR=/home/tolokoban/Code/github/trail-passion
export TP_WWW_ROOT=${TRAILPASSION_DIR}/tp-website/backend/www
alias tp='cd ~/Code/github/trail-passion/tp-website/backend && echo "Use this command to tail the logs:" && echo "docker logs -f backend-tp-apache-1" && docker compose up'
```

Lander le serveur pour vérifier que tout fonctionne :

```bash
tp
firefox http://localhost:60000/
```


