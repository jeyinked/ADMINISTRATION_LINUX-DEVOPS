
# Script de mise à jour SNA

Automatisation Bash pour télécharger et mettre à jour les bases SNA depuis un serveur FTP sécurisé.

## 🚀 Fonctionnalités
- Détection automatique des versions de fichiers.  
- Téléchargement via **lftp** avec vérification d’intégrité.  
- Sauvegarde de l’ancienne version avant remplacement.  
- Déploiement des nouvelles bases dans le répertoire cible.  
- Notification par email après mise à jour.  

## 📦 Prérequis
- `bash`  
- `lftp`  
- `mail` (MTA configuré pour l’envoi de mails)  

## ⚙️ Configuration
Modifier dans le script :  
- `SERVEUR`, `USERFTP4`, `PASSWD4` (FTP)  
- Répertoires `BASES_SNA` et `BASES_SNA_NEW`  

## ▶️ Utilisation
```bash
./maj_sna.sh


📂 Structure

- BASES_SNA/ → fichiers actifs
- BASES_SNA_NEW/ → staging (téléchargement)
- BASES_SNA.old/ → sauvegardes horodatées

