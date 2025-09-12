#!/bin/bash

# Variables FTP
SERVEUR=ftpsqa.mediapostdata.com
USERFTP4=QxO-x3x5x3-x6x2x6
PASSWD4=xxxxxx
LFTP=/usr/bin/lftp
BASES_SNA_NEW=/home/path/BASES_SNA_NEW
INCR=1

# Variables versions
CAFVNN=/home/path/BASES_SNA/cafvnn*.zip
VERSION_CAFVNN=$(echo "$CAFVNN" | tr -cd '[:digit:]')
NEWVERSION_CAFVNN=$(echo $(($VERSION_CAFVNN+$INCR)))

HX2FVNN=/home/path/BASES_SNA/hx2fvnn*.zip
VERSION_HX2FVNN=$(echo "$HX2FVNN" | tr -cd '[:digit:]' | cut -c 2-4)
NEWVERSION_HX2FVNN=$(echo $(($VERSION_HX2FVNN+$INCR)))

HF2FVNN=/home/path/BASES_SNA/hf2fvnn*.zip
VERSION_HF2FVNN=$(echo "$HF2FVNN" | tr -cd '[:digit:]'| cut -c 2-4)
NEWVERSION_HF2FVNN=$(echo $(($VERSION_HF2FVNN+$INCR)))

HM2FV=/home/path/BASES_SNA/hm2fv*.zip
VERSION_HM2FV=$(echo "$HM2FV" | tr -cd '[:digit:]'| cut -c 2-4)
NEWVERSION_HM2FV=$(echo $(($VERSION_HM2FV+$INCR)))

R2FVNN=/home/path/BASES_SNA/r2fvnn*.zip
VERSION_R2FVNN=$(echo "$R2FVNN" | tr -cd '[:digit:]'| cut -c 2-4)
NEWVERSION_R2FVNN=$(echo $(($VERSION_R2FVNN+$INCR)))

HLFVNN=/home/path/BASES_SNA/hlfvnn*.zip
VERSION_HLFVNN=$(echo "$HLFVNN" | tr -cd '[:digit:]') 
NEWVERSION_HLFVNN=$(echo $(($VERSION_HLFVNN+$INCR)))

# Affichage des versions
echo "la version actuel est cafvnn$(echo "$CAFVNN" | tr -cd '[:digit:]').zip"
echo "la nouvelle version recherché est donc cafvnn${NEWVERSION_CAFVNN}.zip"
sleep 2
echo "la version actuel est hx2fvnn$(echo "$HX2FVNN" | tr -cd '[:digit:]'| cut -c 2-4).zip"
echo "la nouvelle version recherché est donc hx2fvnn${NEWVERSION_HX2FVNN}.zip"
sleep 2
echo "la version actuel est hf2fvnn$(echo "$HF2FVNN" | tr -cd '[:digit:]'| cut -c 2-4).zip"
echo "la nouvelle version recherché est donc hf2fvnn${NEWVERSION_HF2FVNN}.zip"
sleep 2
echo "la version actuel est hm2fv$(echo "$HM2FV" | tr -cd '[:digit:]'| cut -c 2-4).zip"
echo "la nouvelle version recherché est donc hm2fv${NEWVERSION_HM2FV}.zip"
sleep 2
echo "la version actuel est r2fvnn$(echo "$R2FVNN" | tr -cd '[:digit:]'| cut -c 2-4).zip"
echo "la nouvelle version recherché est donc r2fvnn${NEWVERSION_R2FVNN}.zip"
sleep 2 
echo "la version actuel est hlfvnn$(echo "$HLFVNN" | tr -cd '[:digit:]').zip"
echo "la nouvelle version recherché est donc hlfvnn${NEWVERSION_HLFVNN}.zip"
sleep 5 

# Recherche fichiers
echo "recherche de la version de cafvnn${NEWVERSION_CAFVNN}.zip en cours..."
sleep 2
echo "recherche de la version de hx2fvnn${NEWVERSION_HX2FVNN}.zip  en cours..."
sleep 2 
echo "recherche de la version de hf2fvnn${NEWVERSION_HF2FVNN}.zip  en cours..."
sleep 2
echo "recherche de la version de hm2fv${NEWVERSION_HM2FV}.zip  en cours..."
sleep 2
echo "recherche de la version de r2fvnn${NEWVERSION_R2FVNN}.zip  en cours..."
sleep 2 
echo "recherche de la version de hlfvnn${NEWVERSION_HLFVNN}.zip  en cours..."
sleep 5

# Téléchargement
mkdir -p "$BASES_SNA_NEW"
TO_DL=( \
  "cafvnn${NEWVERSION_CAFVNN}.zip" \
  "hx2fvnn${NEWVERSION_HX2FVNN}.zip" \
  "hf2fvnn${NEWVERSION_HF2FVNN}.zip" \
  "hm2fv${NEWVERSION_HM2FV}.zip" \
  "r2fvnn${NEWVERSION_R2FVNN}.zip" \
  "hlfvnn${NEWVERSION_HLFVNN}.zip" \
)

$LFTP -u "$USERFTP4","$PASSWD4" "$SERVEUR" << EOF
set cmd:fail-exit yes
lcd "$BASES_SNA_NEW"
get ${TO_DL[0]}
get ${TO_DL[1]}
get ${TO_DL[2]}
get ${TO_DL[3]}
get ${TO_DL[4]}
get ${TO_DL[5]}
bye
EOF

# Vérif code retour
lftp_rc=$?
if [ $lftp_rc -ne 0 ]; then
  echo "Les fichiers sont pas disponibles (échec lftp, rc=${lftp_rc})"
  exit 1
fi

# Vérif fichiers téléchargés
missing=0
for f in "${TO_DL[@]}"; do
  if [ ! -f "$BASES_SNA_NEW/$f" ]; then
    echo "Fichier manquant après téléchargement: $f"
    missing=1
  fi
done
if [ $missing -ne 0 ]; then
  echo "Les fichiers sont pas tous disponibles. Abandon du traitement."
  exit 1
fi

# Traitement des fichiers
cp -pr /home/path/BASES_SNA/* /home/dqe/BASES_SNA.old/   
rm -rf /home/path/BASES_SNA/*
cp -pr /home/path/BASES_SNA_NEW/* /home/dqe/BASES_SNA/
rm -rf /home/path/BASES_SNA_NEW/*
echo "Nouveaux fichiers disponibles dans /home/dqe/BASES_SNA/"
echo "Bonjour, les nouveaux fichiers pour la MAJ SNA sont disponibles sur BACKUP1 dans /home/path/BASES_SNA/" | mail -s"Nouveaux fichiers SNA disponible sur BACKUP1" jaguas@dqe-software.com
echo "Bonjour, les nouveaux fichiers pour la MAJ SNA sont disponibles sur BACKUP1 dans /home/path/BASES_SNA" | mail -s"Nouveaux fichiers SNA disponible sur BACKUP1" blecocq@dqe-software.com

# Fin script
