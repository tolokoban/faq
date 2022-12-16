# Docker

## Permettre l'utilisateur courant de ne pas utiliser sudo

```sh
sudo groupadd docker
sudo gpasswd -a $USER docker
newgrp docker
```

## Executer bash dans un container

Récupérer le nom du container avec `docker container ls`

```sh
docker exec -ti CONTAINER_NAME bash
```

## Copier un fichier d'un container vers l'hôte

```sh
docker cp CONTAINER_NAME_OR_ID:/etc/apache2 ./config
```
----

[Retour](../README.md)
