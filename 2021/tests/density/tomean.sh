#rm byseeds/mean_*
#for variant in ID L2 CD MOEAD CPDEA R2EMOA;
#do
# for seed in {1..35};
# do 
#  for nobj in 2 3;
#  do
#        Rscript -e 'd<-scan("stdin", quiet=TRUE); cat(median(d), sep=" ")'< byseeds/${variant}_${nobj}_${seed} >>byseeds/mean_${variant}_${nobj}
#	echo "" >>byseeds/mean_${variant}_${nobj}
#  done
# done
#done


rm byproblem/mean_*

for variant in ID L2 CD MOEAD CPDEA R2EMOA;
do
 for instance in WFG1 WFG2 WFG3 WFG4 WFG5 WFG6 WFG7 WFG8 WFG9 DTLZ1 DTLZ2 DTLZ3 DTLZ4 DTLZ5 DTLZ6 DTLZ7;
 do 
  for nobj in 2 3;
  do
        Rscript -e 'd<-scan("stdin", quiet=TRUE); cat(median(d), sep=" ")'< HV/${variant}/${instance}_${nobj} >>byproblem/mean_${variant}_${nobj}
	echo "" >>byproblem/mean_${variant}_${nobj}
  done
 done
done

for variant in ID L2 CD MOEAD CPDEA R2EMOA;
do
 for instance in UF1 UF2 UF3 UF4 UF5 UF6 UF7;
 do 
  nobj=2
        Rscript -e 'd<-scan("stdin", quiet=TRUE); cat(median(d), sep=" ")'< HV/${variant}/${instance}_2 >> byproblem/mean_${variant}_2
	echo "" >>byproblem/mean_${variant}_2
 done
done

for variant in ID L2 CD MOEAD CPDEA R2EMOA;
do
 for instance in UF8 UF9 UF10;
 do 
  nobj=3
        Rscript -e 'd<-scan("stdin", quiet=TRUE); cat(median(d), sep=" ")'< HV/${variant}/${instance}_3 >> byproblem/mean_${variant}_3
	echo "" >>byproblem/mean_${variant}_3
 done
done
