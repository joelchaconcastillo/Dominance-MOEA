#for alg in MOEAD R2EMOA CPDEA VSDMOEA
#do
#  for t in {1..11}
#  do
#   for obj in 2 3
#   do
#      for i in WFG1 WFG2 WFG3 WFG4 WFG5 WFG6 WFG7 WFG8 WFG9 DTLZ1 DTLZ2 DTLZ3 DTLZ4 DTLZ5 DTLZ6 DTLZ7
#      do
#         Rscript -e 'd<-scan("stdin", quiet=TRUE); cat(min(d), max(d), median(d), mean(d), sep=" ")' < POF_HV/${alg}_${i}_${obj}_${t} >> Time_HV/${alg}_${i}_${obj}
#         echo "">> Time_HV/${alg}_${i}_${obj}
#      done
#   done
#  obj=2
#  for i in UF1 UF2 UF3 UF4 UF5 UF6 UF7
#  do
#         Rscript -e 'd<-scan("stdin", quiet=TRUE); cat(min(d), max(d), median(d), mean(d), sep=" ")' < POF_HV/${alg}_${i}_${obj}_${t} >> Time_HV/${alg}_${i}_${obj}
#         echo "">> Time_HV/${alg}_${i}_${obj}
#  done
#  obj=3 
#  for i in UF8 UF9 UF10
#  do
#         Rscript -e 'd<-scan("stdin", quiet=TRUE); cat(min(d), max(d), median(d), mean(d), sep=" ")' < POF_HV/${alg}_${i}_${obj}_${t} >> Time_HV/${alg}_${i}_${obj}
#         echo "">> Time_HV/${alg}_${i}_${obj}
#  done
# done
#done
for alg in MOEAD R2EMOA CPDEA VSDMOEA
do
  for t in {1..11}
  do
      rm tmp
      for i in WFG1 WFG2 WFG3 WFG4 WFG5 WFG6 WFG7 WFG8 WFG9 DTLZ1 DTLZ2 DTLZ3 DTLZ4 DTLZ5 DTLZ6 DTLZ7 UF1 UF2 UF3 UF4 UF5 UF6 UF7
      do
	 cat POF_HV/${alg}_${i}_2_${t} >> tmp
      done
      Rscript -e 'd<-scan("stdin", quiet=TRUE); cat(mean(d), sep=" ")' < tmp >> Time_HV/${alg}_2
       echo "">> Time_HV/${alg}_2
      rm tmp
      for i in WFG1 WFG2 WFG3 WFG4 WFG5 WFG6 WFG7 WFG8 WFG9 DTLZ1 DTLZ2 DTLZ3 DTLZ4 DTLZ5 DTLZ6 DTLZ7 UF8 UF9 UF10
      do
	 cat POF_HV/${alg}_${i}_3_${t} >> tmp
      done
         Rscript -e 'd<-scan("stdin", quiet=TRUE); cat(mean(d), sep=" ")' < tmp >> Time_HV/${alg}_3
         echo "">> Time_HV/${alg}_3
   done
done
