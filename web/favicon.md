# Favicon

Pour les navigateurs utilisant HTML :

```html
<link rel="icon" href="/favicon.ico" sizes="32x32">
<link rel="icon" href="/icon.svg" type="image/svg+xml">
<link rel="apple-touch-icon" href="/apple-touch-icon.png"><!-- 180×180 -->
```

Pour les Proressive Web App :

```html
<link rel="manifest" href="/manifest.webmanifest">
```

Avec ce manifest (`manifest.webmanifest`) :

```json
{
  "icons": [
    { "src": "/icon-192.png", "type": "image/png", "sizes": "192x192" },
    { "src": "/icon-mask.png", "type": "image/png", "sizes": "512x512", "purpose": "maskable" },
    { "src": "/icon-512.png", "type": "image/png", "sizes": "512x512" }
  ]
}
```

Les _maskable_ icones doivent être visibles dans un cercle compris dans 409×409 pixels.
Le site [maskable.app](https://maskable.app/) permet de tester ce genre d'icône.
