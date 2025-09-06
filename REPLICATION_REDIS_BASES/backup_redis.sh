#!/bin/bash
set -euo pipefail   # Arrête en cas d’erreur, variable non définie ou pipe cassé

BACKUP_DIR="/var/path/redis/old"   # Dossier de sauvegarde
RDB_FILE="/var/path/redis/dump.rdb" # Fichier dump Redis
PASS_FILE="/etc/redis/pass.txt"     # Fichier contenant le mot de passe Redis

mkdir -p "$BACKUP_DIR"   # Crée le dossier de sauvegarde si absent

cp -p "$RDB_FILE" "$BACKUP_DIR/dump-$(date +%F-%H%M).rdb"   # Copie du dump avec timestamp

redis-cli -a "$(cat $PASS_FILE)" --rdb "$RDB_FILE"   # Génère un nouveau dump Redis

sha256sum "$RDB_FILE" > "$RDB_FILE.sha256"   # Calcule et stocke la somme SHA256
