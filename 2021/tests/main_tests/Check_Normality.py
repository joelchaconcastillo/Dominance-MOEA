import sys
from scipy import stats
from numpy import *
import re
def check_means(file1, file2):
   mean1 = mean(file1)
   mean2 = mean(file2)
   if mean1 > mean2:
      return 1
   elif mean1 < mean2:
     return -1
   elif mean1==mean2:
     return 0

def process_instance(list_files):
  for i, val1 in enumerate(list_files):
    file1 = loadtxt(val1)
    sys.stdout.write(" "+str(stats.shapiro(file1)[0])+","+str(stats.shapiro(file1)[1]))
#    print(stats.shapiro(file1)[0])
#
#  for i, val1 in enumerate(list_files):
#     sys.stdout.write(" "+str(Wins[i])+" "+str(Losts[i])+" "+str(Ties[i])+" "+str(abs(bestv-mean(loadtxt(val1)))))
#     sys.stdout.flush()
  print("")
#     print val1+" "+str(Wins[i])+" "+str(Losts[i])+" "+str(Ties[i])

##Load the entire file
list_files = open(sys.argv[1], "r")
#list_files = open("file", "r")
#print list_files.read()
#split the text by instance...
#for inst in list_files.read().replace(" ", "").split('--'):
for inst in list_files.read().split('\n'):
    if len(inst) == 0:
        continue
    problem = inst.split(' ')[0]
    algorithms = inst.split(' ')[1:]
    while("" in algorithms): algorithms.remove("") ##remove empty elements
    sys.stdout.write(problem)
    sys.stdout.flush()
    process_instance(algorithms)
#print list_files
#with open("files") as f:
#   lines = f.readlines()
#   print lines
     

#list_files=[]
#list_files.append("a.txt")
#list_files.append("b.txt")
