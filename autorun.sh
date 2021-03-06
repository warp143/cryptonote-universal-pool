#!/bin/bash

#set -x
#trap read debug
session="Pool"
tmux start-server
tmux new-session -d -s $session -n Pool
tmux send-keys "cd /home/amk/GraftNetwork/build/release/bin/" Enter C-m
tmux send-keys "graftnoded" Enter C-m
tmux splitw -h -p 50
tmux send-keys "cd /home/amkgrf/Wallet" Enter C-m
tmux send-keys "sleep 30s ; graft-wallet-rpc --wallet-file /home/amk/Wallet/PoolWallet.dat --password Abcd1234 --rpc-bind-port 8191 --disable-rpc-login --trusted-daemon" Enter C-m
tmux selectp -t 2
tmux splitw -v -p 50
tmux selectp -t 3
tmux send-keys "cd /home/amk/Wallet" Enter C-m
tmux send-keys "sleep 30s ; graft-wallet-cli --wallet-file /home/amk/Wallet/PoolWallet.dat --password Abcd1234" Enter C-m
tmux selectp -t 0
tmux splitw -v -p 50
tmux send-keys "cd /home/amk/Pool/" Enter C-m
tmux send-keys "sleep 10s ; node init.js" Enter C-m
tmux selectp -t 1
tmux new-window -t $session:1 -n scratch
tmux select-window -t $session:0
tmux attach-session -t $session