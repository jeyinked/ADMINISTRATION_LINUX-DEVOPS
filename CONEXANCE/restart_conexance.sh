#!/bin/bash  # Utilise Bash pour exécuter le script

pkill -9 -f Dedup.pyc  # Tue tout processus Dedup.pyc
pkill -9 -f JsonCountServer.pyc  # Tue tout processus JsonCountServer.pyc
pkill -9 -f JsonDedupServer.pyc  # Tue tout processus JsonDedupServer.pyc
pkill -9 -f DQEserveurjson_Neptune_V2.pyc  # Tue tout processus DQEserveurjson_Neptune_V2.pyc

#START SOAP SERVICE
tmux send-keys -t 01_soap:0 "cd /home/dqe/conexance/PyInteractive27_1/" C-m  # Va dans le dossier projet
tmux send-keys -t 01_soap:0 "python2.7 Dedup.pyc /home/dqe/conexance/start_soap /home/dqe/conexance/data/conexance.txt /home/dqe/conexance/DicoTotal2 50 8081 -ip:127.0.0.1" C-m  # Lance le service SOAP
tmux send-keys -t 01_soap:0 Enter  # Envoie un Enter pour valider

sleep 1  # Attend 1 seconde

#START COMPTEUR SERVICE
tmux send-keys -t 02_compteur:0 "cd /home/dqe/conexance/PyInteractive27_1/" C-m  # Va dans le dossier projet
tmux send-keys -t 02_compteur:0 "python2.7 JsonCountServer.pyc -IP:127.0.0.1 -PORT:8001 -URLTAMPONNEXT:https://prod2.dqe-software.com -LICENCENAME:CONEXANCE_V2" C-m  # Lance le service Compteur
tmux send-keys -t 02_compteur:0 Enter  # Envoie un Enter pour valider

sleep 1  # Attend 1 seconde

#START JSON SERVICE
tmux send-keys -t 03_json:0 "cd /home/dqe/conexance/PyInteractive27_1/" C-m  # Va dans le dossier projet
tmux send-keys -t 03_json:0 "python2.7 JsonDedupServer.pyc -SOAPFILE:/home/dqe/conexance/cree_dico_soap -IP:127.0.0.1 -PORT:8083 -IP_SOAP:127.0.0.1 -PORT_SOAP:8081 -IP_COUNT:127.0.0.1 -PORT_COUNT:8001" C-m  # Lance le service JSON
tmux send-keys -t 03_json:0 Enter  # Envoie un Enter pour valider

sleep 1  # Attend 1 seconde

#START CONEXANCE SERVICE
tmux send-keys -t 04_conexance:0 "cd /home/dqe/conexance/PyInteractive27_1/" C-m  # Va dans le dossier projet
tmux send-keys -t 04_conexance:0 "python2.7 DQEserveurjson_Neptune_V2.pyc -IP_SERVER:51.178.xx.xxx -PORT_SERVER:9000 -IP_DQE_JSERVER:127.0.0.1 -PORT_DQE_JSERVER:8083 -PYTHON:/home/dqe/conexance/PyInteractive27_1/algs -FILE_LOG:/home/dqe/conexance/PyInteractive27_1/trace.log" C-m  # Lance le service Conexance
tmux send-keys -t 04_conexance:0 Enter  # Envoie un Enter pour valider

#J@GU@S  # Signature perso
