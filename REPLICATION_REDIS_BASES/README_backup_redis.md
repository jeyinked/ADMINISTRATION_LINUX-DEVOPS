
# Redis RDB Backup Script

Ce script automatise la sauvegarde du fichier `dump.rdb` de Redis.  
Il copie le dump existant avec un timestamp, génère un nouveau dump depuis Redis,  
et crée un fichier `.sha256` pour vérifier l’intégrité.

## Utilisation
- Placer le mot de passe Redis dans `/etc/redis/pass.txt`
- Modifier les chemins si nécessaire
- Lancer le script :  
  ```bash
  ./backup_redis.sh

