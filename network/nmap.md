# nmap

## Trouver tous les serveurs qui écouptent sur le port 3389

On commence par rechercher l'**IP subnet** :

```sh
ip route | grep src | grep -v linkdown
```

On obtient, par exemple, ceci :

```
default via 192.168.1.254 dev enp5s0 proto static src 192.168.1.48 metric 100 
127.0.0.0/8 dev lo proto kernel scope link src 127.0.0.1 metric 30 
172.19.0.0/16 dev br-4f9d81b4397e proto kernel scope link src 172.19.0.1 metric 425 
192.168.1.0/24 dev enp5s0 proto kernel scope link src 192.168.1.48 metric 100 
```

La première ligne nous donne `enp5s0` comme outgoing network interface.
Elle nous dit aussi que notre IP locale est `192.168.1.48`.
On retrouve `dev enp5s0` dans la dernière ligne et le `192.168.1.0/24` est notre **IP subnet**.

On peut alors utiliser la commande `nmap` pour lister les serveurs qui nous intéressent :

```sh
nmap -p 3389 -sV --open 192.168.1.0/24
```
