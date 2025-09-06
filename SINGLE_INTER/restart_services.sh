#!/bin/bash

pkill -9 -f server.py

# singlev3 FIN
tmux new-session -d -s fin
tmux send-keys -t fin:0 "cd /home/dqe/singlev3" C-m
tmux send-keys -t fin:0 "python3 /home/dqe/singlev3/server.py FIN 3460 51.xxx.xx.xxx &" C-m
tmux send-keys -t fin:0 Enter

# singlev3 JPN
tmux new-session -d -s jpn
tmux send-keys -t jpn:0 "cd /home/dqe/singlev3" C-m
tmux send-keys -t jpn:0 "python3 /home/dqe/singlev3/server.py JPN 5760 51.xxx.xx.xxx &" C-m
tmux send-keys -t jpn:0 Enter

# singlev3 KOR
tmux new-session -d -s kor
tmux send-keys -t kor:0 "cd /home/dqe/singlev3" C-m
tmux send-keys -t kor:0 "python3 /home/dqe/singlev3/server.py KOR 3470 51.xxx.xx.xxx &" C-m
tmux send-keys -t kor:0 Enter

# singlev3 SGP
tmux new-session -d -s sgp
tmux send-keys -t sgp:0 "cd /home/dqe/singlev3" C-m
tmux send-keys -t sgp:0 "python3 /home/dqe/singlev3/server.py SGP 7470 51.xxx.xx.xxx &" C-m
tmux send-keys -t sgp:0 Enter

# singlev3 ITA
tmux new-session -d -s ita
tmux send-keys -t ita:0 "cd /home/dqe/singlev3" C-m
tmux send-keys -t ita:0 "python3 /home/dqe/singlev3/server.py ITA 4822 xx.xxx.xx.xxx &" C-m
tmux send-keys -t ita:0 Enter

# singlev3 BEL
tmux new-session -d -s bel
tmux send-keys -t bel:0 "cd /home/dqe/singlev3" C-m
tmux send-keys -t bel:0 "python3 /home/dqe/singlev3/server.py BEL 8000 51.xxx.xx.xxx &" C-m
tmux send-keys -t bel:0 Enter





exit 0
