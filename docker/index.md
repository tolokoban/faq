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

----

[Retour](../index.md)
