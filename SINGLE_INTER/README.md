

# singlev3-server-launcher

Ce script Bash permet de lancer automatiquement plusieurs instances de `server.py` dans des sessions **tmux** séparées.  
Chaque instance est associée à une région (FIN, JPN, KOR, SGP, ITA, BEL) et écoute sur un port spécifique.  

## Fonctionnalités
- Arrête proprement les anciennes instances de `server.py`
- Crée des sessions tmux dédiées pour chaque serveur
- Relance automatiquement les serveurs avec les bons arguments

## Prérequis
- Linux / Unix
- [tmux](https://github.com/tmux/tmux/wiki) installé
- Python 3 installé
- Le script `server.py` présent dans `/home/dqe/singlev3`

## Utilisation
```bash
./launch_servers.sh
