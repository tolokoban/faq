# Node Package Manager (`npm`)

## Variables d'environnement ajoutées par `npm`

`npm` lit le fichier `package.json` pour populer plusieurs variables d'environnement qui peuvent ête utilisées comme dans cet exemple :

```json
{
    "scripts": {
        "tag": "git tag v$npm_package_version",
    }     
}
```

Pour connaître la liste de toutes ces variables, tapez :

```sh
npm run env | grep 'npm_'
```

