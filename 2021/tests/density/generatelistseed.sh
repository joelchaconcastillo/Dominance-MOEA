PATHA=byseeds/ 
for seed in {1..35};
do
    echo -n "--"${seed}_2" "; 
      for j in ID L2 CD CPDEA MOEAD R2EMOA 
      do
        echo -n ${PATHA}/${j}_2_${seed}" "
      done
    echo
done
for seed in {1..35}
do
   echo -n "--"${seed}_3" "; 
    for j in ID L2 CD CPDEA MOEAD R2EMOA 
    do
      echo -n ${PATHA}/${j}_3_${seed}" "
    done
    echo
done
