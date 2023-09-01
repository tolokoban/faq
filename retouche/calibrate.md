# Calibrage d'écran (KDE)

Voir aussi :
* https://www.davidrevoy.com/article913/fedora-36-kde-spin-for-a-digital-painting-workstation-reasons-and-post-install-guide
* http://www.lagom.nl/lcd-test/contrast.php

Installer les packages suivants :

```bash
sudo apt install colord-kde
```

ou

```bash
sudo dnf install colord-kde
```

Maintenant il faut récupérer un profile `*.icc` généré avec un appareil (par exemple un SpyderX sur Mac).
Et on le copie au bon endroit :

```bash
cp ./profile.icc /usr/share/color/icc/colord/
```

Il faut maintenant trouver l'identifiant de l'écran cible :

```bash
colormgr get-devices
```

Dans la liste qui apparaît, ce qui nous intéresse est le champ **Device ID**.
Il faut maintenant récurérer l'identifiant de notre profil.

```bash
colormgr get-profiles
```

L'identifiant est dans le champ **Profile ID**.

Il ne reste plus qu'à attribuer un profil à l'écran :

```bash
colormgr device-add-profile HDMI-A-1 icc-ec1a714f116713d9eddb7cf9f11de80b
```



