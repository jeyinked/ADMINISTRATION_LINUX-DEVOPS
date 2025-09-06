# Redis Dump Update Script

Ce script permet de mettre à jour le fichier `dump.rdb` d'un serveur Redis depuis une source distante, avec vérification d'intégrité et sauvegarde horodatée de l'ancien dump.

## Fonctionnalités
- Téléchargement du `dump.rdb` et de son `sha256`.
- Vérification de l'intégrité avec `sha256sum -c`.
- Arrêt de Redis, backup horodaté de l'ancien dump, remplacement du fichier.
- Redémarrage et vérification de l'état du service.

## Utilisation
1. Modifier l'hôte et les chemins si besoin.
2. Exécuter le script en tant que root :
   ```bash
   sudo ./update_redis_dump.sh
