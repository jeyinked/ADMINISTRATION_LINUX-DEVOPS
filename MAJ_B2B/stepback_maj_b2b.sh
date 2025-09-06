#!/bin/bash                  # Déclare l’interpréteur Bash

#-->[VARIABLES]<--
jaguas=/home/jaguas/test/    # Définit le chemin jaguas (non utilisé plus bas)
db=/home/dqe/b2b/db/         # Chemin de la base de données active
old_db=/home/dqe/b2b/db-old/ # Chemin de l’ancienne base
new_db=/home/dqe/b2b/db-new/ # Chemin de la nouvelle base (non utilisé plus bas)
stock_path=/home/dqe/b2b/stock/   # Chemin des fichiers stock
dico_path=/home/dqe/b2b/stock/Dico/ # Chemin du dictionnaire

#-->[STEPBACK]<--
cd ${db} && cp -pr ${old_db}* .          # Copie l’ancienne DB dans la DB active
cd ${stock_path} && cp -pr stock.csv.old stock.csv # Restaure l’ancien fichier stock.csv
cd ${dico_path} && cp -pr siretinsee.dqe.old siretinsee.dqe # Restaure l’ancien fichier siretinsee.dqe

#-->[RELANCE TMUX]<--
tmux send-keys -t B2B:0 "cd /home/dqe/b2b/" C-m   # Change de répertoire dans la session tmux
tmux send-keys -t B2B:0 "python2 /home/dqe/b2b/b2b.py -ip:ip_addr_server -port:8084 &" C-m # Lance b2b.py dans tmux
tmux send-keys -t B2B:0 Enter                     # Envoie un Enter supplémentaire

tmux send-keys -t B2B:0 "python2 /home/dqe/b2b/Notice80_v2.py -fic:/home/dqe/b2b/stock/stock.csv -dico:/home/dqe/b2b/stock/Dico -ip:ip_addr_server -port:9090 -REQUEST:50 &" C-m # Lance Notice80_v2.py dans tmux
tmux send-keys -t B2B:0 Enter                     # Envoie un Enter supplémentaire

exit 0    # Termine le script proprement
