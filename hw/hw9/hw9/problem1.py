##################################
### Solutions to problem 2 hw9 ###
### 	Kevin Chau cs70-zh	   ###
##################################

#Partners: Sam Drake, Serena Chan

import random
import numpy as np
import scipy.stats as stats
from scipy import integrate
import math
import matplotlib as mpl, matplotlib.pyplot as plot

def biasedCoin (p):
	# Creates a biased coin with p(Head) = p
	# Returns true if heads and false otherwise

	# Should check this!
	# assert p >= 0 and p <= 1
	return random.random() <= p

def runTrial (p, k):
	# Runs a trial of k tosses of a biased coin (w.p. p of heads)
	# and returns number of heads
	return sum([biasedCoin(p) for _ in xrange(k)])

def runManyTrials (p, k, m):
	# Runs m trials of k tosses of a biased coin (w.p. p of heads)
	# and returns all the numbers of heads
	return [runTrial(p, k) for _ in xrange(m)]

def calculateQuartileGap(results):
	# Calculates the quartile 
	results.sort()
	n = len(results)
	q1 = int(round(0.25*n))
	q3 = int(round(0.75*n))
	return results[q3]-results[q1]

def linspace(a,b,n):
	# Returns n numbers evenly spaced between a and b, inclusive
	return [(a+(b-a)*i*1.0/(n-1)) for i in xrange(n)]

##############
### PART A ###
##############

def parta(pranges=[0.3,0.4,0.5,0.6,0.9], kranges = [100,1000,4000], m=1000, show_indiv=False):
	# Q2 part (k)
	print('Question 2 part (k):')
	for k in kranges:
		plot.clf()
		results = {}
		print ('Number of trials k = %i'%k)
		for p in pranges:
			print ('Probability of head p = %.1f'%p)
			std = math.sqrt(p*(1-p))
			results[p] = [(Sk -k*p)/(math.sqrt(k)*std) for Sk in runManyTrials(p, k, m)]
			results[p].sort()
			plot.plot(results[p],linspace(0,1,m),label=str(p))
			x_values = np.arange(-3.0,3.1,.1)
			y_values = list()
			for i in x_values:
				y_values.append(integral(i))
			plot.plot(x_values,y_values,linewidth=4, color='y')
		plot.legend()
		plot.ylabel('Frequency')
		plot.xlabel('Normalized and centered fraction of heads')
		plot.title('k = %i, p = %s'%(k,str(pranges)))
		plot.show()

def integrand(x):
	return ((1/math.sqrt(2*math.pi))*math.exp(-1*(math.pow(x,2)/2)))

def integral(d):
	return integrate.quad(lambda x: integrand(x),-np.inf,d)

##############
### PART B ###
##############
# This is just the sum of all X_i from i=0 to to i = k. So S = X_1 + X_2 + ... + X_k

##############
### PART C ###
##############
def scale_integrand(x):
	return 750*integrand(x)

def partc(pranges=[0.3,0.4,0.5,0.6,0.7,0.9], kranges = [10,100,1000,4000], m=1000, show_indiv=False):
	# Q2 part (j)
	print('Question 2 part (j):')
	for p in pranges:
		print ('Probability of head p = %.1f'%p)
		std = math.sqrt(p*(1-p))
		results = {}
		for k in kranges:
			results[k] = [(Sk -k*p)/(math.sqrt(k)*std) for Sk in runManyTrials(p, k, m)]
			if show_indiv:
				# bins = 9 so as to not have gaps in the display
				plot.hist(results[k],bins=9,label=str(k))
				plot.show()
		plot.clf()
		x_values = np.arange(-5,5,.1)
		y_values = [scale_integrand(i) for i in x_values]
		for k in kranges:
			# bins = 9 so as to not have gaps in the display
			plot.hist(results[k],bins=9,label=str(k),histtype='barstacked')
		plot.legend()
		plot.ylabel('Frequency')
		plot.xlabel('Normalized and centered fraction of heads')
		plot.title('k = %s, p = %.1f'%(str(kranges),p))
		plot.plot(x_values,y_values)
		plot.show()	

##############
### PART D ###
##############
def int_a(a,p):
	return a*math.log((a/p),math.e)+(1-a)*math.log(((1-a)/(1-p)),math.e)

def func(a,p,k):
	return math.pow(math.e,(-1*int_a(a,p)*k))

def partd():
	r = np.arange(10,200,1)

	p_vals = [.3,.7]
	a_vals = [.05,.1]
	m = 10000
	for p in p_vals:
		for a_shift in a_vals:
			a = p + a_shift
			arr = [func(a,p,k) for k in r]
			plot.semilogy(r,arr)
			deltay = math.log(arr[-1])-math.log(arr[0])
			slope = deltay/190
			print("slope: " + str(slope))
	results = []
	for k in range(10,200):
		total = 0
		for n in runManyTrials(p,k,m):
			if n > a*k:
				total += 1
		results.append(total/float(m))
	plot.semilogy(range(10,200),results)
	plot.show()

##############
### PART E ###
##############
def funct (eps,p,k):
	return p*(1-p)/(k*math.pow(eps,2))

def parte():
	x_values = np.arange(10,201)

	m = 10000
	p = .3
	for eps in [.1,.2,.3]:
		results = []
		for k in x_values:
			arr = [math.fabs(Sk -k*p) for Sk in runManyTrials(p, k, m)]
			total = 0
			for elem in arr:
				if elem >= eps*k:
					total += 1
			results.append(total / float(m))
	plot.plot(x_values,results)
	plot.plot(x_values,[funct(eps,p,k) for k in x_values])
	plot.show()

##############
### PART F ###
##############
def choose(n,k):
	return math.factorial(n)/(math.factorial(k)*math.factorial(n-k))

def partf():
	x_values = np.arange(0,50.1,1)

	y_values = [choose(50,k) for k in x_values]

	plot.plot(x_values,y_values)
	plot.show()
