#!/bin/bash   # Indique que le script doit être exécuté avec bash

pkill -9 -f server.py   # Tue tous les processus server.py en cours

# singlev3 FIN
tmux new-session -d -s fin   # Crée une nouvelle session tmux nommée fin
tmux send-keys -t fin:0 "cd /home/dqe/singlev3" C-m   # Change de répertoire dans la session
tmux send-keys -t fin:0 "python3 /home/dqe/singlev3/server.py FIN 3460 51.xxx.xx.xxx &" C-m   # Lance server.py avec FIN
tmux send-keys -t fin:0 Enter   # Envoie Entrée pour exécuter la commande

# singlev3 JPN
tmux new-session -d -s jpn   # Crée une nouvelle session tmux nommée jpn
tmux send-keys -t jpn:0 "cd /home/dqe/singlev3" C-m   # Change de répertoire dans la session
tmux send-keys -t jpn:0 "python3 /home/dqe/singlev3/server.py JPN 5760 51.xxx.xx.xxx &" C-m   # Lance server.py avec JPN
tmux send-keys -t jpn:0 Enter   # Envoie Entrée pour exécuter la commande

# singlev3 KOR
tmux new-session -d -s kor   # Crée une nouvelle session tmux nommée kor
tmux send-keys -t kor:0 "cd /home/dqe/singlev3" C-m   # Change de répertoire dans la session
tmux send-keys -t kor:0 "python3 /home/dqe/singlev3/server.py KOR 3470 51.xxx.xx.xxx &" C-m   # Lance server.py avec KOR
tmux send-keys -t kor:0 Enter   # Envoie Entrée pour exécuter la commande

# singlev3 SGP
tmux new-session -d -s sgp   # Crée une nouvelle session tmux nommée sgp
tmux send-keys -t sgp:0 "cd /home/dqe/singlev3" C-m   # Change de répertoire dans la session
tmux send-keys -t sgp:0 "python3 /home/dqe/singlev3/server.py SGP 7470 51.xxx.xx.xxx &" C-m   # Lance server.py avec SGP
tmux send-keys -t sgp:0 Enter   # Envoie Entrée pour exécuter la commande

# singlev3 ITA
tmux new-session -d -s ita   # Crée une nouvelle session tmux nommée ita
tmux send-keys -t ita:0 "cd /home/dqe/singlev3" C-m   # Change de répertoire dans la session
tmux send-keys -t ita:0 "python3 /home/dqe/singlev3/server.py ITA 4822 xx.xxx.xx.xxx &" C-m   # Lance server.py avec ITA
tmux send-keys -t ita:0 Enter   # Envoie Entrée pour exécuter la commande

# singlev3 BEL
tmux new-session -d -s bel   # Crée une nouvelle session tmux nommée bel
tmux send-keys -t bel:0 "cd /home/dqe/singlev3" C-m   # Change de répertoire dans la session
tmux send-keys -t bel:0 "python3 /home/dqe/singlev3/server.py BEL 8000 51.xxx.xx.xxx &" C-m   # Lance server.py avec BEL
tmux send-keys -t bel:0 Enter   # Envoie Entrée pour exécuter la commande

exit 0   # Quitte le script proprement
