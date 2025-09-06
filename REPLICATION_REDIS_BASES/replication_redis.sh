#!/bin/bash

echo "etape 1 .. telechargement du dump.rdb sur redislog.."
scp -pr jerome@redislog-xxx.dqe-soft.git:/var/path/redis/dump.rdb        /var/path/redis/
scp -pr jerome@redislog-xxx.dqe-soft.git/var/path/redis/dump.rdb.sha256 /var/path/redis/ 
echo "etape 1 ok..fichier dump.rdb et son sha256 telechargé"
echo "etape 2 ... comparaison des sha256sum"
sha256sum /var/path/redis/dump.rdb > /var/path/redis/test.dump.rdb.sha256
diff /var/path/redis/dump.rdb.sha256 /var/path/redis/test.dump.rdb.sha256 
if [ "$?" -eq "0" ]
then
chown redis:redis /var/path/redis/dump.rdb
systemctl stop redis
sleep 5
mv /var/lib/redis/dump.rdb /var/lib/redis/old/
cp -pr /var/path/redis/dump.rdb /var/lib/redis/
systemctl start redis
else
exit
fi
