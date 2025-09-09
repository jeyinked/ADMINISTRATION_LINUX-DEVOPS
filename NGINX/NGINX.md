# 🚀 Configuration Nginx optimisée

Ce dépôt contient un fichier `nginx.conf` prêt à l’emploi, pensé pour être **sécurisé, performant et documenté**.  
Chaque ligne est commentée pour faciliter la compréhension et la personnalisation.

---

## ✨ Fonctionnalités principales

- ✅ **Optimisation réseau** avec `sendfile`, `tcp_nopush` et `tcp_nodelay`
- ✅ **Sécurité renforcée**
  - Masquage de la version (`server_tokens off`)
  - TLS moderne uniquement (`TLSv1.2` et `TLSv1.3`)
- ✅ **Protection contre le flood / DoS léger** grâce au `limit_req_zone`
- ✅ **Compression gzip optimisée** pour de meilleures performances
- ✅ **Structure claire** avec séparation des `sites-enabled` et `conf.d`

---

## 📂 Structure

- `nginx.conf` : configuration principale de Nginx
- `/etc/nginx/conf.d/` : configuration générique (par site)
- `/etc/nginx/sites-enabled/` : hôtes virtuels activés

---

## 🔧 Utilisation

1. Sauvegarde ta configuration actuelle :
   ```bash
   sudo cp /etc/nginx/nginx.conf /etc/nginx/nginx.conf.bak
   ```
```bash
Copie le fichier nginx.conf de ce dépôt dans /etc/nginx/ : sudo cp nginx.conf /etc/nginx/nginx.conf
Teste la syntaxe : sudo nginx -t
Recharge Nginx : sudo systemctl reload nginx
```
