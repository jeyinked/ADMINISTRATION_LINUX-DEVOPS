# singlev3-tmux-launcher

Ce dépôt contient un script Bash permettant de lancer automatiquement plusieurs instances de `server.py` dans des sessions **tmux** séparées.  
Chaque session correspond à un pays/serveur, avec ses propres paramètres (nom, port, IP).

## Fonctionnement

Le script :
- Crée une session tmux par serveur (FIN, JPN, KOR, SGP, ITA, BEL).
- Se place dans le répertoire `/home/dqe/singlev3`.
- Lance `server.py` avec les arguments adaptés (code pays, port, IP).
- Permet de garder les processus actifs même après déconnexion SSH.

## Utilisation

```bash
chmod +x launch_servers.sh     # Rendre exécutable
./launch_servers.sh            # Lancer les serveurs
