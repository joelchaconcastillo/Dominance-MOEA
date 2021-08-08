m=VSDMOEA
rm byseeds/${m}/*_2_*
for i in DTLZ1 DTLZ2 DTLZ3 DTLZ4 DTLZ5 DTLZ6 DTLZ7 UF1 UF2 UF3 UF4 UF5 UF6 UF7 WFG1 WFG2 WFG3 WFG4 WFG5 WFG6 WFG7 WFG8 WFG9;
do
  for di in 0.0 0.1 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9 1.0;
  do
     for s in {1..35};
     do
        head -n $s source/${m}/${i}_2_${di} | tail -1 >> byseeds/${m}/${s}_2_${di}
     done
  done
done
  rm byseeds/${m}/*_3_*
for i in DTLZ1 DTLZ2 DTLZ3 DTLZ4 DTLZ5 DTLZ6 DTLZ7 UF8 UF9 UF10 WFG1 WFG2 WFG3 WFG4 WFG5 WFG6 WFG7 WFG8 WFG9;
do
  for di in 0.0 0.1 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9 1.0;
  do
     for s in {1..35};
     do
        head -n $s source/${m}/${i}_3_${di} | tail -1 >> byseeds/${m}/${s}_3_${di}
     done
  done
done
alg=VSDMOEA
for obj in 2 3;
do
    rm ${alg}_${obj};
    for di in 0.0 0.1 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9;
    do
     for s in {1..35}
     do
  	   echo -n \"${di}\"' ' >> ${alg}_${obj}
	   cat byseeds/${alg}/${s}_${obj}_${di} | awk -F'\t' '{ sum += $1 } END { print sum / NR }' >> ${alg}_${obj}
     done
     echo  >> ${alg}_${obj}
     echo  >> ${alg}_${obj}
   done
    di=1.0
    for s in {1..35}
     do
  	   echo -n \"${di}\"' ' >> ${alg}_${obj}
	   cat byseeds/${alg}/${s}_${obj}_${di} | awk -F'\t' '{ sum += $1 } END { print sum / NR }' >> ${alg}_${obj}
     done
done
