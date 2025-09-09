# Script de vérification de licence dans les logs

Ce script Bash permet d'extraire un fichier de logs compressé, puis de rechercher une licence spécifique à l'intérieur.

## Fonctionnement

1. L'utilisateur renseigne :
   - Une date au format `AAAAMM`
   - Une date complète au format `AAAAMMDD`
   - Une licence à vérifier
2. Le script copie et décompresse le fichier log correspondant.
3. La licence est recherchée dans le fichier extrait.
4. Le résultat est sauvegardé dans un fichier dédié.

## Utilisation

```bash
./script_email_logs.sh

