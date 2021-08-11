alg=byseeds/VSDMOEA
  rm ${alg}_2;
  for di in 0.0 0.1 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9 1.0;
  do
    for line in $(cat ${alg}/*_2_${di});
   do
	   echo \"${di}\" $line >> ${alg}_2
   done
   echo  >> ${alg}_2
   echo  >> ${alg}_2
  done
  rm ${alg}_3;
  for di in 0.0 0.1 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9 1.0;
  do
    for line in $(cat ${alg}/*_3_${di});
   do
	   echo \"${di}\" $line >> ${alg}_3
   done
   echo  >> ${alg}_3
   echo  >> ${alg}_3
  done
