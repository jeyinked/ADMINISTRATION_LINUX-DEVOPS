# SSHD Configuration

Exemple de `sshd_config` pour sécuriser un serveur derrière un bastion.

## Principes
- Connexions SSH uniquement via l’IP du bastion  
- Authentification **par clé publique uniquement**  
- Mots de passe et challenge-response désactivés  
- Root interdit en mot de passe  

## Utilisation
1. Copier le fichier dans `/etc/ssh/sshd_config`  
2. Remplacer `ip_du_bastion` par l’adresse du bastion  
3. Vérifier la syntaxe :  
   ```bash
   sudo sshd -t
