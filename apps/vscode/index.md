# VS Code

## Installer le SSH Remote Server locallement

```bash
wget --no-check-certificate https://update.code.visualstudio.com/commit:5235c6bb189b60b01b1f49062f4ffa42384f8c91/server-linux-x64/stable
```
Le commit (`5235c6...`) peut être trouvé dans le menu Help/About du VSCode client.

Il suffit maintenant de le décompresser dans `~/.vscode-server/bin/5235c6bb189b60b01b1f49062f4ffa42384f8c91`

```
tar xzvf ./stable
cd vscode-server-linux-x64
mkdir ~/.vscode-server/bin/5235c6bb189b60b01b1f49062f4ffa42384f8c91
cp -vr * mkdir ~/.vscode-server/bin/5235c6bb189b60b01b1f49062f4ffa42384f8c91/
```

----

[Back](../index.md)
