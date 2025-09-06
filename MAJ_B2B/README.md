# B2B Reset Script

Ce script Bash permet de **restaurer les fichiers de base** (base de données, stock et dictionnaire) puis de **relancer automatiquement les services** dans une session `tmux`.

## Fonctionnement

1. Restaure les anciens fichiers depuis `db-old`, `stock.csv.old` et `siretinsee.dqe.old`.
2. Relance les programmes Python nécessaires (`b2b.py` et `Notice80_v2.py`) dans la session `tmux` nommée `B2B`.

## Utilisation

```bash
./reset_b2b.sh

⚠️ Assurez-vous que la session tmux B2B:0 existe avant d’exécuter le script.

Prérequis
Linux / Bash
tmux installé et une session B2B:0 existante
Python 2.x disponible



