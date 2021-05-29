args <- commandArgs(trailingOnly = TRUE)
library('scmamp')
#data = read.table("o2")##file with the files
data = read.table(args[1])##file with the files
NR = nrow(data)
NC = ncol(data)
alpha=0.05

print(apply(data[1, 2:NC], 1, paste, collapse = " "))
pvalue_friedman = matrix(0, nrow=NC, ncol=1) ##storing omnibus pvalues..
for(r in 1:nrow(data)) 
{
  samplesize=nrow(read.table(data[r, 2]))
  dataset = matrix(nrow=samplesize, ncol=NC-1)
  score = matrix(0, nrow=3, ncol=NC-1) ##wins, loses, ties(draw) each one in cols
  WIN=1
  LOSE=2
  TIE=3
  for(c in 2:NC)
  {
     dataset[,c-1]=read.table(data[r,c])[,1]
  }
  colnames(dataset) = c(data[r, 2:NC])
  FriedmantestH0 = imanDavenportTest(dataset) ##Omnibus Friedman test
  pvalue_friedman[r] = FriedmantestH0$p.value
  if(FriedmantestH0$p.value < alpha) #reject H0
  {
     result = postHocTest(data = dataset, test = 'friedman', correct = 'bergmann')
     for(i in 1:(NC-1))
     {
       for(j in i:(NC-1))
       {
	      if(i==j){next}
           if(result$corrected.pval[i,j] < alpha)
           {
	      if(mean(dataset[,i]) > mean(dataset[,j]))
	      {
		score[WIN, i] = score[WIN, i]+1
		score[LOSE, j] = score[LOSE, j]+1
	      }
	      else if(mean(dataset[,i]) < mean(dataset[,j]))
	      {
		score[LOSE, i] = score[LOSE, i]+1
    	        score[WIN, j] = score[WIN, j]+1
	      }
	      else
	      {
		score[TIE, i] = score[TIE, i]+1
    	        score[TIE, j] = score[TIE, j]+1
	      }
           }
           else ##There is not enough evidence to reject H0
           {
	     score[TIE, i] = score[TIE, i]+1
    	     score[TIE, j] = score[TIE, j]+1
           }
       }
     }
  }
  else
  {	     
     score[TIE, ] = score[TIE, ]+NC-2 #each algorithm scores Nalg-1 ties, i.e. tie with the remaining ones
  }
  flatten = matrix(score, nrow=1,ncol=(NC-1)*3)
  print(paste( data[r,1],apply(flatten, 1, paste, collapse = " ")))
}
  print(pvalue_friedman)
