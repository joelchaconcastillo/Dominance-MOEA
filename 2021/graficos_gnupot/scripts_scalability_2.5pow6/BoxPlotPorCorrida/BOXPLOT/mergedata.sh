for alg in CPDEA MOEAD R2EMOA VSDMOEA;
do
  rm ${alg}_2;
  for nvar in 50 100 250 500;
  do
    for line in $(cat ../${alg}/*_2_${nvar});
   do
	   echo \"${nvar}\" $line >> ${alg}_2
   done
   echo  >> ${alg}_2
   echo  >> ${alg}_2
  done
done

for alg in CPDEA MOEAD R2EMOA VSDMOEA;
do
  rm ${alg}_3;
  for nvar in 50 100 250 500;
  do
    for line in $(cat ../${alg}/*_3_${nvar});
   do
	   echo \"${nvar}\" $line >> ${alg}_3
   done
   echo  >> ${alg}_3
   echo  >> ${alg}_3
  done
done
