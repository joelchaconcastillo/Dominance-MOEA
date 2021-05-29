import sys
import scikit_posthocs as sp
import re
import statsmodels.api as sa
import scipy.stats as ss
import statsmodels.formula.api as sfa
import pandas as pd
from scipy import stats
from numpy import *
alpha=0.05
def check_means(file1, file2):
   mean1 = mean(file1)
   mean2 = mean(file2)
   if mean1 > mean2:
      return 1
   elif mean1 < mean2:
     return -1
   else:
     return 0

def process_instance(list_files):
  ##Load all the algoritms in a different class..
  Wins=[0]*len(list_files)
  Losts=[0]*len(list_files)
  Ties=[0]*len(list_files)
  data = list()
  for i, val1 in enumerate(list_files):
    data.append(loadtxt(val1))
  ##Run kruskal test, a p-value > 0.05 accepts the null hypothesis
  T, p = ss.kruskal(*data)
  ##null hypothesis is rejected, try a post-hoc analyzes with a correction procedure
  if p < alpha: 
    ptable = sp.posthoc_dunn(data, p_adjust = 'holm')
    for i in range(0,len(list_files)):
        val1=list_files[i]
        for j in range(0, i):
            val2=list_files[j]
            if ptable.iat[i,j] > alpha:
                Ties[i]+=1
                Ties[j]+=1
            else:
                if check_means(loadtxt(val1),loadtxt(val2)) == 1: 
                  Wins[i]+=1
                  Losts[j]+=1
                elif check_means(loadtxt(val1),loadtxt(val2)) == -1: 
                  Wins[j]+=1
                  Losts[i]+=1
                else:
                  Ties[i] +=1
                  Ties[j] +=1
  else:
   Ties[0:len(list_files)] += ones(len(list_files))*(len(list_files)-1)
  for i, val1 in enumerate(list_files):
    sys.stdout.write(" "+str(Wins[i])+" "+str(Losts[i])+" "+str(Ties[i]))
    sys.stdout.flush()
  print("")

def process_instance_info(list_files):
  ##Load all the algoritms in a different class..
  Wins=[0]*len(list_files)
  Losts=[0]*len(list_files)
  Ties=[0]*len(list_files)
  data = list()
  for i, val1 in enumerate(list_files):
    data.append(loadtxt(val1))
  ##Run kruskal test, a p-value > 0.05 accepts the null hypothesis
  T, p = ss.kruskal(*data)
  bestv=-100000
  for i, val1 in enumerate(list_files):
     bestv = max(bestv, mean(loadtxt(val1)))
  for i, val1 in enumerate(list_files):
     sys.stdout.write(" "+str(abs(bestv-mean(loadtxt(val1)))))
     sys.stdout.flush()
  print("")

def Kruskal_Posthoc_dunn_score():
  list_files = open(sys.argv[1], "r")
  for inst in list_files.read().replace(" ", "").split('--'):
     instance_list=[]
     flag = 0
     if len(inst) == 0:
         continue
     for line in inst.split('\n'):
          if re.match(r'^\s*$', line):
             continue
          if flag == 0:
             sys.stdout.write(line)
             sys.stdout.flush()
  	   #print "instance  "+line
             flag = 1
          else:
             instance_list.append(line)	
     process_instance(instance_list)
def Kruskal_Posthoc_dunn_info():
  print("Kruskal test with posthoc dunn and holm correction")
  list_files = open(sys.argv[1], "r")
  for inst in list_files.read().replace(" ", "").split('--'):
     instance_list=[]
     flag = 0
     if len(inst) == 0:
         continue
     for line in inst.split('\n'):
          if re.match(r'^\s*$', line):
             continue
          if flag == 0:
             sys.stdout.write(line+" ")
             sys.stdout.flush()
             flag = 1
          else:
             instance_list.append(line)	
     process_instance_info(instance_list)
#####################################MAIN####################
##Load the entire file
Kruskal_Posthoc_dunn_score()
Kruskal_Posthoc_dunn_info()

