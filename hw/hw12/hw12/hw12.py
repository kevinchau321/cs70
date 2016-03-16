# CS70, Spring 2014
# Homework 12, problem 5 lab
# python (version 2.7.6) skeleton


import math
import matplotlib.pyplot as plt
import numpy as np
import random
import sys


#---------
# GLOBALS
#---------


#---------
# HELPERS
#---------


# Creates a biased coin with Pr(Head) = p
# Returns true if heads and false otherwise
def biasedCoin(p):
    return random.random() <= p


# input:  the probability p of winning the lottery on any given day
# output: the number of tickets Lily has to buy to win the lottery
def lotteryTrial(p):
    count = 1
    x = True
    while x:
        if biasedCoin(p)==False:
            count = count+1
        else:
            x = False
    return count
    #print('todo')


# input:  x, the number of lottery tickets and p, the probability of winning on a given day
# output: the probability of buying x lottery tickets (i.e. f(x))
def lotteryPmf(x,p):
    # YOUR CODE HERE
    return ((1-p)**(x-1))*p
    #print('todo')


# input: input:  x, the number of lottery tickets and p, the probability of winning on a given day
# output: the probability of buying x or fewer lottery tickets (i.e. F(x))
def lotteryCmf(x,p):
    # YOUR CODE HERE
    print('todo')


# Q5, part (b)
def partB(p=0.2, m=10000):
    # run trials
    tickets = []
    for i in range(1,m):
        tickets.append(lotteryTrial(p))

    plt.hist(tickets,bins = 100, normed = True)


    # overlay f(x)
    x = np.linspace(0, 100, 256, endpoint=True)
    plt.plot(x,lotteryPmf(x,p))
    # print the average number of lottery tickets
    print("Lily will most often only have to buy 1 ticket for a probability of .2 winning")

    # set up plot
    plt.xlabel("x = number of lottery tickets")
    plt.ylabel("fraction of trials with x lottery tickets")
    plt.title("Q5, part (b)")
    plt.legend()
    plt.show()

    
# Q5, part (e)
def partF(p=0.2, m=10000):
    # run trials
    # YOUR CODE HERE

    # plot empirical cmf
    # YOUR CODE HERE

    # overlay F(x)
    # YOUR CODE HERE

    # set up plot
    plt.xlabel("x = number of lottery tickets")
    plt.ylabel("fraction of trials with x or fewer lottery tickets")
    plt.title("Q5, part (e)")
    plt.legend()
    plt.show()
    
    
#------
# MAIN
#------


partmap = {'b':partB, 'B':partB,
           'e':partF, 'E':partF}

if __name__=='__main__':
    if len(sys.argv) > 1:
        if sys.argv[1] in partmap:
            partmap[sys.argv[1]]()
        else: print("Invalid part number %s."%sys.argv[1])
    else:
        print('Usage: python hw12_skeleton.py [part number]')


