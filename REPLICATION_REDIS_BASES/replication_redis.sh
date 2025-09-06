#!/bin/bash
set -euo pipefail                             # arrête le script en cas d'erreur

echo "etape 1 .. telechargement du dump.rdb sur redislog.."
scp -pr jerome@redislog-xxx.dqe-soft.git:/var/path/redis/dump.rdb /var/path/redis/   # copie dump.rdb
scp -pr jerome@redislog-xxx.dqe-soft.git:/var/path/redis/dump.rdb.sha256 /var/path/redis/  # copie checksum
echo "etape 1 ok..fichier dump.rdb et son sha256 telechargé"

echo "etape 2 ... verification du sha256sum"
pushd /var/path/redis > /dev/null             # se place dans le dossier local
sha256sum -c dump.rdb.sha256                  # vérifie l'intégrité du fichier
popd > /dev/null                              # revient au dossier précédent

echo "checksum OK, on remplace le dump.rdb"
chown redis:redis /var/path/redis/dump.rdb    # donne la propriété au user redis
systemctl stop redis                          # stoppe le service redis
sleep 5                                       # attend 5 secondes

mkdir -p /var/lib/redis/old                   # crée le dossier de backup si absent
if [ -f /var/lib/redis/dump.rdb ]; then
    mv /var/lib/redis/dump.rdb "/var/lib/redis/old/dump.rdb.$(date +%F-%H%M%S)"  # backup horodaté
fi

cp -pr /var/path/redis/dump.rdb /var/lib/redis/   # copie le nouveau dump
systemctl start redis                          # relance le service redis

if systemctl is-active --quiet redis; then
    echo "Redis est reparti ✅"                 # confirme que redis tourne
else
    echo "Redis ne tourne pas ❌"               # avertit si redis est KO
    exit 1
fi
