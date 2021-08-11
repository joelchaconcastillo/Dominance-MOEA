for m in CPDEA VSDMOEA MOEAD R2EMOA
#for m in MOEAD
do
    rm byseeds/${m}/*_2_*
  for i in DTLZ1 DTLZ2 DTLZ3 DTLZ4 DTLZ5 DTLZ6 DTLZ7 UF1 UF2 UF3 UF4 UF5 UF6 UF7 WFG1 WFG2 WFG3 WFG4 WFG5 WFG6 WFG7 WFG8 WFG9;
  do
    for nvar in 50 100 250 500;
    do
       for s in {1..35};
       do
          #sort -n source/${m}/${i}_2_${nvar} | head -n $s | tail -1 >> byseeds/${m}/${s}_2_${nvar}
          cat source/${m}/${i}_2_${nvar} | head -n $s | tail -1 >> byseeds/${m}/${s}_2_${nvar}
       done
    done
  done
    rm byseeds/${m}/*_3_*
  for i in DTLZ1 DTLZ2 DTLZ3 DTLZ4 DTLZ5 DTLZ6 DTLZ7 UF8 UF9 UF10 WFG1 WFG2 WFG3 WFG4 WFG5 WFG6 WFG7 WFG8 WFG9;
  do
    for nvar in 50 100 250 500;
    do
       for s in {1..35};
       do
          #sort -n source/${m}/${i}_3_${nvar} | head -n $s | tail -1 >> byseeds/${m}/${s}_3_${nvar}
          cat source/${m}/${i}_3_${nvar} | head -n $s | tail -1 >> byseeds/${m}/${s}_3_${nvar}
       done
    done
  done
done
for obj in 2 3;
do
  for alg in CPDEA MOEAD R2EMOA VSDMOEA;
  #for alg in MOEAD ;
  do
    rm ${alg}_${obj};
    for nvar in 50 100;
    do
      for s in {1..35}
     do
  	   echo -n \"${nvar}\"' ' >> ${alg}_${obj}
#	   cat byseeds/${alg}/${s}_${obj}_${nvar} | awk -F'\t' '{ sum += $1 } END { print sum / NR }' >> ${alg}_${obj}
	   Rscript -e 'd<-scan("stdin", quiet=TRUE); cat(median(d), sep=" ")'< byseeds/${alg}/${s}_${obj}_${nvar} >> ${alg}_${obj}
	   echo "">>${alg}_${obj}
     done
     echo  >> ${alg}_${obj}
     echo  >> ${alg}_${obj}
   done
	nvar=250
    for s in {1..35}
     do
  	   echo -n \"${nvar}\"' ' >> ${alg}_${obj}
	   #cat byseeds/${alg}/${s}_${obj}_${nvar} | awk -F'\t' '{ sum += $1 } END { print sum / NR }' >> ${alg}_${obj}
	   Rscript -e 'd<-scan("stdin", quiet=TRUE); cat(median(d), sep=" ")'< byseeds/${alg}/${s}_${obj}_${nvar} >> ${alg}_${obj}
	   echo "">>${alg}_${obj}
     done

  done
done

