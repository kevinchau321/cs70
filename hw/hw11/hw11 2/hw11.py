"""
CS70 Spring 2014: 
Homework 11 -- skeleton
Question 1: Virtual lab

For Python 2.7
"""
from __future__ import division
import random
import math
import matplotlib as mpl, matplotlib.pyplot as plot
import numpy as np

################################################################################
# Useful util functions:
################################################################################
def linspace(a,b,n):
    # Returns n numbers evenly spaced between a and b, inclusive
    return [(a+(b-a)*i/(n-1)) for i in xrange(n)]

################################################################################
# Convenient helper functions:
# You may use these if you want or you could write everything on your own.
# NOTE: NOT ALL OF THESE ARE FILLED IN; YOU NEED TO WRITE SOME OF THEM ON YOUR OWN.
################################################################################
def throwBallIntoBins (n):
    # Randomly throws a ball into n bins and returns
    # the index of the bin from 1 to n.
    return int(math.ceil(random.random()*n))

def throwManyBallsIntoBins (m,n):
    # Randomly throws m balls into n bins and returns
    # a list of indices from 1 to n
    return [throwBallIntoBins(n) for _ in xrange(m)]

def checkForCollision (trial):
    # Checks if there is a collision in a trial
    # Returns true if there is a collision
    return len(trial) > len(set(trial))

def runManyBallBinTrials (m,n,t):
    # Runs t trials of throwning m balls into n
    # Returns a list of t trials
    return [throwManyBallsIntoBins(m,n) for _ in xrange(t)]

def runManyBallBinTrialsCheckCollision (trials):
    # Returns a list of "checkForCollision" on each trial
    return [checkForCollision(trial) for trial in trials]

def generateManyBirthdays(m):
    # Randomly generates m birthdays
    return throwManyBallsIntoBins (m,365)

def repeatingBirthdays (bday_trial):
    # Returns true if there are shared birthdays and false otherwise
    return checkForCollision(bday_trial)

def runManyBirthdayTrials (m,t):
    # Runs t trials of generating random birthdays for m people and
    # returns a list of T/F depending on whether there were repeating 
    # birthdays or not
    trials = runManyBallBinTrials (m,365,t)
    return runManyBallBinTrialsCheckCollision (trials)

def birthdayNoCollisionProb (m):

    # Probability that there is no collision given that there are m birthdays

    # Uses Stirling's approximation

    # NOTE: Make sure you simplify your expression before plugging it in here.



    # YOUR CODE GOES HERE

    a = (365/(365-m)) ** 365

    b = ((365-m) / (365*math.e)) ** m

    c = 1/(1 - (m / 365))**(1/2)

    return 1 - a * b * c

def maxLoadFromTrial (trial):
    # Returns the maximum load on any bin given a trial
    return max([trial.count(i) for i in set(trial)])

def loadBalancingManyTrials (n,t):
    # Returns a list of load balancing trials (list of bin numbers for each ball thrown)
    return [throwManyBallsIntoBins(n,n) for _ in xrange(t)]

def loadBalancingManyTrialsMaxLoad (trials):
    # Returns a list of maximum loads given trials
    return [maxLoadFromTrial(trial) for trial in trials]

def loadBalancingManyTrialsCountBinI (trials,i):
    # Returns a list of number of balls in bin i for each trial, given trials
    return [trial.count(i) for trial in trials]

def getCumulativeCounts (trials):
    # Returns distinct values in trials and cumulative counts of trials >= k for each k in values
    trials.sort()
    load_vals = sorted(list(set(trials)))
    counts = [trials.count(v) for v in load_vals]
    cumulative_counts = [sum(counts[i:]) for i in range(len(counts))]
    return load_vals, cumulative_counts

def probApprox(k, n, with_e=False, with_one_minus_one_over_n=False):
    # Just a function which approximates the probabilities as needed
    # The probability being approximated is that bin 1 has load >= k
    # This T/F arguments basically switch on/off the different things
    # being asked in the parts (k) and (l).

    # NOTE: Remember to clamp the probability at 1 if it goes above.

    pass   

################################################################################
# Actual code skeleton:
################################################################################
def partA (mrange=[10,23,50,60], t=100):

    # Q1(a)



    # trial_results is the list of results from running t trials of m birthdays for each m.

    trial_results = []

    ##################
    for m in mrange:

        trials = runManyBirthdayTrials (m,t) #return list of True/False

        trial_results.append(trials.count(True) / t)
    ##################

    ticks = range(len(mrange)) # for plotting

    plot.bar(ticks, trial_results)

    plot.xlabel('Number of people')

    # Add 0.5 to make labels centered

    plot.xticks([tck + 0.5 for tck in ticks], mrange)

    plot.ylabel('Fraction of trials with repeats')

    plot.title('Birthday paradox')

    plot.show()

def partB():

    # Q1(b)
    # Range of m values to check
    mrange = xrange(1,81)
    pvals = []
    # NOTE: Don't use Stirling's approximation directly.
    # Simplify your expression after using the approximation
    # as much as possible before you plug it in here.
    ##################
    for m in mrange:
        pvals.append(birthdayNoCollisionProb(m))
    ##################

    # pvals is list of calculated probabilities for each value of m

    plot.plot(mrange, pvals)

    plot.ylabel('Probability of repeating birthdays',fontsize='medium')

    plot.xlabel('Number of people',fontsize='medium')

    plot.title('Birthday paradox')

    plot.show()

#partB()



def partC (nrange=[100,365,500,1000], t=1000):
    # Q1(c)
    for n in nrange:

        print 'n =',n

        mrange = sorted([int(0.1*n), int(0.3*n), int(math.sqrt(n))])

        # trial_results is the list of results from running t trials of m birthdays for each m.

        trial_results = []

        ##################

        for m in mrange:

            trials = runManyBallBinTrials (m,n,t)

            collisions = runManyBallBinTrialsCheckCollision (trials)

            trial_results.append(collisions.count(True) / 1000)

        
        ##################



        ticks = range(len(mrange)) # for plotting

        plot.bar(ticks, trial_results)

        plot.xlabel('Number of balls')

        # Add 0.5 to make labels centered

        plot.xticks([tck + 0.5 for tck in ticks], mrange)

        plot.ylabel('Fraction of trials with colliding balls')

        plot.title('n=%i'%n)

        plot.show()

#partC()



def partD():

    # Q1(d)



    xvals = linspace(0.01,0.1,100)

    logvals = []



    ##################

    for x in xvals:

        logvals.append(np.log(1 - x))



    ##################

    # logvals - values of ln(1-x)

    plot.plot(xvals, logvals)

    plot.ylabel('ln(1-x)')

    plot.xlabel('x')

    plot.title('ln(1-x)')

    plot.show()

    print('Approximate slope: ')

    print((np.log(1 - .1) - np.log(1- .02)) / (.1 - .02))

#partD()



def partE (nrange=[100,365,500,1000], t=1000):

    # Q1(e)
    for n in nrange:
        print 'n =',n
        mrange = [int(m) for m in linspace(1,2*math.sqrt(n),20)]
        mrange = sorted(list(set(mrange))) # in order to remove duplicate entries.
        # log_results is the list of the logarithm of the fractions from the experiments
        log_results = []
        ##################
        for m in mrange:
            trials = runManyBallBinTrials (m,n,t)
            collisions = runManyBallBinTrialsCheckCollision (trials)
            log_results.append(-1 * np.log(collisions.count(True) / 1000))
        ##################



        plot.bar(mrange, log_results)

        plot.xlabel('Number of balls')

        plot.ylabel('-Ln(fraction of trials with collision)')

        plot.title('n=%i'%n)

        plot.show()

#partE()



def partF (nrange=[100,365,500,1000], t=1000):

    # Q1(f)



    for n in nrange:

        print 'n =',n

        mrange = [int(m) for m in linspace(1,2*math.sqrt(n),20)]

        mrange = sorted(list(set(mrange))) # in order to remove duplicate entries.



        # This is the list of the logarithm of the fractions from the experiments

        log_results = []

        # This is m^2/2n

        m_over_2n_squared = []

        trials_m = []

        calc_m = []



        ##################

        for m in mrange:

            trials = runManyBallBinTrials (m,n,t)

            collisions = runManyBallBinTrialsCheckCollision (trials)

            log_results.append(-1 * np.log(collisions.count(True) / 1000))

            m_over_2n_squared.append(m**2 / (2*n))

            

        



        ##################



        #print "Trial m for which P(A) = 0.5:", trials_m

        #print "Calculated m for which P(A) = 0.5:", calc_m

        #print "Absolute difference in m values for P(A) = 0.5:", abs(trials_m - calc_m)

        plot.bar(mrange, log_results)

        plot.plot(mrange, m_over_2n_squared)

        plot.xlabel('Number of balls')

        plot.ylabel('-Ln(fraction of trials with collision), m^2/2n')

        plot.title('n=%i'%n)

        plot.show()

#partF()



def partG (nrange=[10,50,100,1000], t=1000):

    # Q1(g)

    max_loads = []

    for n in nrange:

        print 'n =',n



        ##################

        trials = loadBalancingManyTrials(n,t)

        max_loads.append(loadBalancingManyTrialsMaxLoad(trials))



        ##################



        plot.hist(max_loads)

        plot.xlabel('Max load on bins')

        plot.ylabel('Number of trials')

        plot.title('n=%i'%n)

        plot.show()

#partG()



def partH (nrange=[10,50,100,1000], t=1000):

    # Q1(h)

    max_load_vals = []

    cumulative_fracs = []

    for n in nrange:

        print 'n =',n



        ##################

        trials = loadBalancingManyTrialsMaxLoad(loadBalancingManyTrials(n,t))

        max_load_vals,cumulative_fracs = getCumulativeCounts(trials)

        



        ##################



        # max_load_vals is the different possible (distinct) maximum load values from the trials

        # cumulative_fracs is the total fraction of trials which had max load <= k for each k in max_load_vals

        plot.plot(max_load_vals, cumulative_fracs)

        plot.xlabel('Max load on bins')

        plot.ylabel('Fraction of trials')

        plot.title('n=%i'%n)

        plot.show()

#partH() 