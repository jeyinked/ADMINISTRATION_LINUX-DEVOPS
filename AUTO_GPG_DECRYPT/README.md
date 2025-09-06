
# 🔐 GPG Bulk Decrypt Script

Ce projet contient un script **Bash** permettant de déchiffrer automatiquement tous les fichiers présents dans un dossier donné avec **GPG**, puis de sauvegarder leur contenu en clair dans un autre dossier.

---

## 📌 Fonctionnement

Le script :
1. Parcourt tous les fichiers du dossier `in/` (par défaut `/home/dqe/lechos_parisien/in`).
2. Déchiffre chaque fichier avec `gpg`.
3. Sauvegarde le résultat dans le dossier `out/` (par défaut `/home/dqe/lechos_parisien/out`) sous la forme :
nom_du_fichier.original → nom_du_fichier.original.decrypt.txt

4. Affiche un message de succès ✅ ou d’échec ❌ pour chaque fichier.

---

## 📂 Structure des dossiers

/home/dqe/lechos_parisien/
in/ # Contient les fichiers chiffrés (.gpg, etc.)
out/ # Contiendra les fichiers déchiffrés en clair
decrypt.sh # Le script Bash

---


## 🚀 Utilisation

1. Cloner ce dépôt ou copier le script `decrypt.sh` dans votre environnement.
2. Vérifier que `gpg` est installé :
   ```bash
   gpg --version

3. Rendre le script exécutable: chmod +x decrypt_gpg.sh
4. Lancer le script : ./decrypt_gpg.sh


   
