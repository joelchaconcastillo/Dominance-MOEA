  rm VSDMOEA_2;
  for Di in 0.0 0.1 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9 1.0
  do
    for line in $(cat ../LINEAL/*_2_${Di});
   do
	   echo \"${Di}\" $line >> VSDMOEA_2
   done
   echo  >> VSDMOEA_2
   echo  >> VSDMOEA_2
  done

  rm VSDMOEA_3;
  for Di in 0.0 0.1 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9 1.0
  do
    for line in $(cat ../LINEAL/*_3_${Di});
   do
	   echo \"${Di}\" $line >> VSDMOEA_3
   done
   echo  >> VSDMOEA_3
   echo  >> VSDMOEA_3
  done
