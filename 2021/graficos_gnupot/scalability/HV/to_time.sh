for nvar in 50 100 250 500;
do
  for alg in MOEAD R2EMOA CPDEA VSDMOEA
  do
    for t in {1..11}
    do
     for obj in 2 3
     do
#        for i in WFG1 WFG2 WFG3 WFG4 WFG5 WFG6 WFG7; #WFG8 WFG9 DTLZ1 DTLZ2 DTLZ3 DTLZ4 DTLZ5 DTLZ6 DTLZ7
 #       do
           #Rscript -e 'd<-scan("stdin", quiet=TRUE); cat(min(d), max(d), median(d), mean(d), sep=" ")' < POF_HV/${alg}_${i}_${obj}_${t} >> Time_HV/${alg}_${i}_${obj}
           #echo "">> Time_HV/${alg}_${i}_${obj}
           Rscript -e 'd<-scan("stdin", quiet=TRUE); cat(min(d), max(d), median(d), mean(d), sep=" ")' < POF_HV/${alg}_${obj}_${nvar}_${t} >> Time_HV/${alg}_${obj}_${nvar}
           echo "">> Time_HV/${alg}_${obj}_${nvar}
 #       done
     done
#    obj=2
#    for i in UF1 UF2 UF3 UF4 UF5 UF6 UF7
#    do
#           Rscript -e 'd<-scan("stdin", quiet=TRUE); cat(min(d), max(d), median(d), mean(d), sep=" ")' < POF_HV/${alg}_${i}_${obj}_${t} >> Time_HV/${alg}_${i}_${obj}
#           echo "">> Time_HV/${alg}_${i}_${obj}
#    done
#    obj=3 
#    for i in UF8 UF9 UF10
#    do
#           Rscript -e 'd<-scan("stdin", quiet=TRUE); cat(min(d), max(d), median(d), mean(d), sep=" ")' < POF_HV/${alg}_${i}_${obj}_${t} >> Time_HV/${alg}_${i}_${obj}
#           echo "">> Time_HV/${alg}_${i}_${obj}
#    done
   done
  done
done
