#!/bin/bash

# Vérifie si une session tmux existe, sinon la crée
create_session() {
  local session=$1
  if ! tmux has-session -t $session 2>/dev/null; then
    tmux new-session -d -s $session
  fi
}

#--- START SOAP SERVICE ---
create_session 01_soap  # Crée la session si elle n'existe pas
tmux send-keys -t 01_soap:0 "cd /home/dqe/conexance/PyInteractive27_1/" C-m  # Change de dossier
tmux send-keys -t 01_soap:0 "python2.7 Dedup.pyc /home/dqe/conexance/start_soap /home/dqe/conexance/data/conexance.txt /home/dqe/conexance/DicoTotal2 50 8081 -ip:127.0.0.1" C-m  # Lance le service SOAP
tmux send-keys -t 01_soap:0 Enter  # Valide la commande
sleep 1  # Attend 1 seconde

#--- START COMPTEUR SERVICE ---
create_session 02_compteur
tmux send-keys -t 02_compteur:0 "cd /home/dqe/conexance/PyInteractive27_1/" C-m
tmux send-keys -t 02_compteur:0 "python2.7 JsonCountServer.pyc -IP:127.0.0.1 -PORT:8001 -URLTAMPONNEXT:https://prod2.dqe-software.com -LICENCENAME:CONEXANCE_V2" C-m
tmux send-keys -t 02_compteur:0 Enter
sleep 1

#--- START JSON SERVICE ---
create_session 03_json
tmux send-keys -t 03_json:0 "cd /home/dqe/conexance/PyInteractive27_1/" C-m
tmux send-keys -t 03_json:0 "python2.7 JsonDedupServer.pyc -SOAPFILE:/home/dqe/conexance/cree_dico_soap -IP:127.0.0.1 -PORT:8083 -IP_SOAP:127.0.0.1 -PORT_SOAP:8081 -IP_COUNT:127.0.0.1 -PORT_COUNT:8001" C-m
tmux send-keys -t 03_json:0 Enter
sleep 1

#--- START CONEXANCE SERVICE ---
create_session 04_conexance
tmux send-keys -t 04_conexance:0 "cd /home/dqe/conexance/PyInteractive27_1/" C-m
tmux send-keys -t 04_conexance:0 "python2.7 DQEserveurjson_Neptune_V2.pyc -IP_SERVER:51.178.XX.XXX -PORT_SERVER:9000 -IP_DQE_JSERVER:127.0.0.1 -PORT_DQE_JSERVER:8083 -PYTHON:/home/dqe/conexance/PyInteractive27_1/algs -FILE_LOG:/home/dqe/conexance/PyInteractive27_1/trace.log" C-m
tmux send-keys -t 04_conexance:0 Enter
