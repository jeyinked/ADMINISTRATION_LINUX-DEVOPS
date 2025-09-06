#!/bin/bash   # Indique que le script doit être interprété avec bash

# singlev3 FIN
tmux new-session -d -s fin   # Crée une session tmux détachée nommée "fin"
tmux send-keys -t fin:0 "cd /home/dqe/singlev3" C-m   # Va dans le répertoire du projet
tmux send-keys -t fin:0 "python3 /home/dqe/singlev3/server.py FIN 3460 51.xxx.xx.xxx &" C-m   # Lance server.py avec args
tmux send-keys -t fin:0 Enter   # Envoie un Enter supplémentaire

# singlev3 JPN
tmux new-session -d -s jpn   # Crée une session tmux "jpn"
tmux send-keys -t jpn:0 "cd /home/dqe/singlev3" C-m   # Va dans le dossier du projet
tmux send-keys -t jpn:0 "python3 /home/dqe/singlev3/server.py JPN 5760 51.xxx.xx.xxx &" C-m   # Lance server.py JPN
tmux send-keys -t jpn:0 Enter   # Envoie Enter

# singlev3 KOR
tmux new-session -d -s kor   # Crée une session tmux "kor"
tmux send-keys -t kor:0 "cd /home/dqe/singlev3" C-m   # Va dans le dossier
tmux send-keys -t kor:0 "python3 /home/dqe/singlev3/server.py KOR 3470 51.xxx.xx.xxx &" C-m   # Lance server.py KOR
tmux send-keys -t kor:0 Enter   # Envoie Enter

# singlev3 SGP
tmux new-session -d -s sgp   # Crée une session tmux "sgp"
tmux send-keys -t sgp:0 "cd /home/dqe/singlev3" C-m   # Va dans le dossier
tmux send-keys -t sgp:0 "python3 /home/dqe/singlev3/server.py SGP 7470 51.xxx.xx.xxx &" C-m   # Lance server.py SGP
tmux send-keys -t sgp:0 Enter   # Envoie Enter

# singlev3 ITA
tmux new-session -d -s ita   # Crée une session tmux "ita"
tmux send-keys -t ita:0 "cd /home/dqe/singlev3" C-m   # Va dans le dossier
tmux send-keys -t ita:0 "python3 /home/dqe/singlev3/server.py ITA 4822 xx.xxx.xx.xxx &" C-m   # Lance server.py ITA
tmux send-keys -t ita:0 Enter   # Envoie Enter

# singlev3 BEL
tmux new-session -d -s bel   # Crée une session tmux "bel"
tmux send-keys -t bel:0 "cd /home/dqe/singlev3" C-m   # Va dans le dossier
tmux send-keys -t bel:0 "python3 /home/dqe/singlev3/server.py BEL 8000 51.xxx.xx.xxx &" C-m   # Lance server.py BEL
tmux send-keys -t bel:0 Enter   # Envoie Enter

exit 0   # Quitte le script avec code 0 (succès)
