#!/usr/bin/env bash          

# Active des options de sécurité :e : stoppe le script si une commande échoue, u : stoppe si une variable non définie est utilisée
#, -o pipefail : fait échouer tout un pipeline si une commande échoue.
set -euo pipefail             
                              
# Change le séparateur interne (Internal Field Separator).
IFS=$'\n\t'                   

                         
indir="/home/dqe/lechos_parisien/in"   # Dossier d'entrée contenant les fichiers chiffrés
outdir="/home/dqe/lechos_parisien/out" # Dossier de sortie pour les fichiers déchiffrés

mkdir -p "$outdir"             # Crée le dossier de sortie s'il n'existe pas déjà (-p évite une erreur si déjà présent)

# Active "nullglob" : si aucun fichier ne correspond au motif (*), le glob s'étend en liste vide au lieu de rester littéral ("*.gpg").
#→ permet d'éviter les erreurs si le dossier est vide.
shopt -s nullglob              
                              
                              

for file in "$indir"/*; do     # Boucle sur chaque fichier du dossier d'entrée
  [ -f "$file" ] || continue   # Vérifie que c'est bien un fichier régulier
                               # (ignore les dossiers, liens, etc.)

  filename=$(basename "$file") # Extrait uniquement le nom du fichier (sans le chemin complet)
  outfile="$outdir/${filename}.decrypt.txt" # Définit le chemin du fichier de sortie

  # Lance la commande gpg pour déchiffrer
  if gpg --batch --quiet --decrypt --output "$outfile" "$file"; then
    echo "✅ Déchiffré : $filename → $outfile"   # Si ça marche : affiche un message de succès
  else
    echo "❌ Échec : $filename" >&2             # Sinon : affiche un message d'erreur sur stderr (>&2)
  fi
done                           # Fin de la boucle
