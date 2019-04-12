import os
import random
import sys
import time
from time import sleep

W="\x1b[0m"
R="\x1b[1;31m"
G="\x1b[1;32m"
Y="\x1b[1;33m"
B="\x1b[34m"
P="\x1b[35m"
C="\x1b[1;36m"
GR="\x1b[37m"

def type(s):
    for c in s + '\n':
        sys.stdout.write(c)
        sys.stdout.flush()
        time.sleep(random.random() * 0.1)
type(Y+'Kejarlah kesempurnaan maka kesuksesan akan menghampirimu.\nBelajar apa yang kau sukai maka kau akan mudah memahami.')
sleep(1)
type(G+"Jagalah hati jangan kau kotori...\nJagalah hati Cahaya Ilahi...")
sleep(1)
type(P+"@SleepingForest™")
