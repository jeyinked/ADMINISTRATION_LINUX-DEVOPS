#!/bin/bash                          # Indique que le script doit être exécuté avec bash

###################### CONTEXT ########################################################

read -p "Veuillez indiquer l'année et le mois (format AAAAMM) : " PARA1   # Demande à l'utilisateur l'année et le mois (ex: 202509)
read -p "Veuillez indiquer l'année, le mois et le jour (format AAAAMMDD) : " PARA2   # Demande l'année, le mois et le jour (ex: 20250909)
read -p "Veuillez indiquer la licence à vérifier : " LICENCE              # Demande quelle licence rechercher dans le fichier

###################### VARIABLES ######################################################

DATE_LOG="ficlog-${PARA1}.txt.${PARA2}.tgz"       # Construit le nom du fichier log compressé attendu
PATH_LOG="/home/path/email/log"                   # Répertoire où se trouvent les logs
HOME_JAGUAS="/home/jaguas"                        # Répertoire de travail où seront copiés et extraits les fichiers
TMP_FILE="ficlog-${PARA1}.txt.processing"         # Nom du fichier texte extrait après décompression
OUTPUT_FILE="${DATE_LOG}_serv4"                   # Nom du fichier résultat après recherche

###################### TRAITEMENT #####################################################

if [[ ! -f "${PATH_LOG}/${DATE_LOG}" ]]; then     # Vérifie si le fichier log compressé existe dans le dossier source
    echo "❌ Erreur : le fichier ${PATH_LOG}/${DATE_LOG} n'existe pas."   # Affiche un message d'erreur si le fichier est absent
    exit 1                                        # Quitte le script avec un code d'erreur
fi

cp -pr "${PATH_LOG}/${DATE_LOG}" "${HOME_JAGUAS}" || { echo "❌ Erreur lors de la copie."; exit 1; }  
# Copie le fichier log compressé vers le dossier de travail, sinon affiche une erreur et quitte

cd "${HOME_JAGUAS}" || { echo "❌ Impossible d'accéder à ${HOME_JAGUAS}"; exit 1; }  
# Change de répertoire vers le dossier de travail, sinon affiche une erreur et quitte

tar xzvf "${DATE_LOG}" || { echo "❌ Erreur lors de l'extraction."; exit 1; }  
# Décompresse le fichier .tgz, sinon affiche une erreur et quitte

rm -f "${DATE_LOG}"                               # Supprime le fichier compressé après extraction

if [[ ! -f "${TMP_FILE}" ]]; then                 # Vérifie que le fichier extrait existe bien
    echo "❌ Erreur : le fichier ${TMP_FILE} n'a pas été trouvé après extraction."   # Affiche une erreur si absent
    exit 1                                        # Quitte le script
fi

grep "${LICENCE}" "${TMP_FILE}" > "${OUTPUT_FILE}"  
# Recherche la licence dans le fichier extrait et redirige le résultat dans un nouveau fichier

rm -f "${TMP_FILE}"                               # Supprime le fichier temporaire extrait après utilisation

echo "✅ Le fichier ${OUTPUT_FILE} est dispo dans ${HOME_JAGUAS}"  
# Informe l’utilisateur que le résultat est disponible

###################### FIN ############################################################
