#!/bin/bash

#-->[VARIABLES]<--
jaguas=/home/jaguas/test/
db=/home/dqe/b2b/db/
old_db=/home/dqe/b2b/db-old/
new_db=/home/dqe/b2b/db-new/
stock_path=/home/dqe/b2b/stock/
dico_path=/home/dqe/b2b/stock/Dico/

#-->[STEPBACK]<--
cd ${db} && cp -pr ${old_db}* .
cd ${stock_path} && cp -pr stock.csv.old stock.csv
cd ${dico_path} && cp -pr siretinsee.dqe.old siretinsee.dqe

#-->[RELANCE TMUX]<--
tmux send-keys -t B2B:0 "cd /home/dqe/b2b/" C-m
tmux send-keys -t B2B:0 "python2 /home/dqe/b2b/b2b.py -ip:ip_addr_server -port:8084 &" C-m
tmux send-keys -t B2B:0 Enter

tmux send-keys -t B2B:0 "python2 /home/dqe/b2b/Notice80_v2.py -fic:/home/dqe/b2b/stock/stock.csv -dico:/home/dqe/b2b/stock/Dico -ip:ip_addr_server -port:9090 -REQUEST:50 &" C-m
tmux send-keys -t B2B:0 Enter

exit 0
