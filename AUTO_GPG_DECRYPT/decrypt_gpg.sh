#!/bin/bash

list=$(cd /home/dqe/lechos_parisien/in/ && ls *)


for i in $list
do
cd  /home/dqe/lechos_parisien/in/ && gpg --decrypt $i > /home/dqe/lechos_parisien/out/${i}.decrypt.txt
done
root@lechos-parisien-1:/home/dqe/lechos_parisien#
