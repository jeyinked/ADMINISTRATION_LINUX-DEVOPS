user www-data;                           # Utilisateur système qui exécute Nginx
worker_processes auto;                   # Ajuste automatiquement le nombre de workers selon les CPU
pid /run/nginx.pid;                      # Emplacement du fichier PID de Nginx
include /etc/nginx/modules-enabled/*.conf; # Inclusion des modules additionnels activés

events {
    worker_connections 1024;             # Nombre maximum de connexions simultanées par worker
    # multi_accept on;                   # (optionnel) Accepter plusieurs connexions à la fois
}

http {
    ##
    # Rate limiting (anti-flood/DDOS)
    ##
    limit_req_zone $binary_remote_addr zone=limit:10m rate=70r/s; # Définit une zone mémoire "limit" pour limiter à 70 requêtes/s par IP
    limit_req zone=limit burst=10 nodelay;                        # Autorise un burst de 10 requêtes sans délai avant de limiter

    ##
    # Basic Settings
    ##
    sendfile on;                          # Active l’envoi optimisé des fichiers
    tcp_nopush on;                        # Regroupe les paquets pour optimiser le réseau
    tcp_nodelay on;                       # Envoie les petits paquets sans délai
    types_hash_max_size 2048;             # Optimise la table de hachage des types MIME
    server_tokens off;                    # Masque la version de Nginx pour plus de sécurité
    # server_names_hash_bucket_size 64;   # (optionnel) Taille du hash pour les noms de serveurs
    # server_name_in_redirect off;        # (optionnel) Empêche la fuite du hostname en redirection

    include /etc/nginx/mime.types;        # Charge la liste des types MIME
    default_type application/octet-stream; # Définit le type par défaut pour les fichiers inconnus

    ##
    # SSL Settings
    ##
    ssl_protocols TLSv1.2 TLSv1.3;        # Autorise uniquement les protocoles TLS modernes
    ssl_prefer_server_ciphers on;         # Préfère les suites de chiffrement du serveur
    # ssl_ciphers 'ECDHE-...';            # (optionnel) Liste de suites de chiffrement modernes

    ##
    # Logging Settings
    ##
    access_log /var/log/nginx/access.log; # Fichier de log des accès HTTP
    error_log  /var/log/nginx/error.log warn; # Fichier de log des erreurs avec niveau "warn"

    ##
    # Gzip Settings
    ##
    gzip on;                              # Active la compression gzip
    gzip_vary on;                         # Ajoute l’en-tête "Vary: Accept-Encoding"
    gzip_proxied any;                     # Active gzip même si la requête est proxifiée
    gzip_comp_level 6;                    # Niveau de compression (équilibre perf/CPU)
    gzip_buffers 16 8k;                   # Nombre et taille des buffers gzip
    gzip_http_version 1.1;                # Version HTTP minimale pour gzip
    gzip_types                             # Types de contenu compressés
        text/plain
        text/css
        text/javascript
        application/javascript
        application/json
        application/xml
        application/xml+rss
        text/xml
        image/svg+xml;

    ##
    # (Optionnel) Taille max des uploads
    ##
    # client_max_body_size 50m;           # Définit la taille max des fichiers uploadés

    ##
    # Virtual Host Configs
    ##
    include /etc/nginx/conf.d/*.conf;     # Inclut les configs des vhosts (fichiers .conf)
    include /etc/nginx/sites-enabled/*;   # Inclut les sites activés (liens symboliques)
}
