# Réseau

## Quelle application écoute ce port?

```sh
lsof -i :3000
```

## Quelle est mon adresse IP?

### Local address

```sh
hostname -I
```

```sh
nmcli -p device show
```

### Global address

```sh
dig +short txt ch whoami.cloudflare @1.0.0.1
```

Or go to https://whatismyipaddress.com/

