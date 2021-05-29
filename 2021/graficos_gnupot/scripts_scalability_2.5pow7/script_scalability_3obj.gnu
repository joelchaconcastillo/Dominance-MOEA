MOEAD= "#99ffff"; CPDEA= "#4671d5"
set terminal pngcairo
set output "scalability_3obj_2x107.png"
#set terminal postscript portrait enhanced mono dashed lw 1 "Helvetica" 14 
#set output "my-plot.ps"
set yrange [-0.1:1.4]
set ylabel "Normalized HV"
set xlabel "Number of Decision Variables"
set title "Scalability with three objectives"
set autoscale xfix

set style fill solid 0.25 border -1
set style boxplot nooutliers pointtype 7
set style data boxplot
set boxwidth 0.5

stats "BOXPLOT/CPDEA_3" using 2 nooutput
#
plot for [i=0:STATS_blocks-1] "BOXPLOT/VSDMOEA_3" using (8*i):2 index i lt 1 lc rgb 'white'title (i==0 ? 'VSD-MOEA' : ''),\
     for [i=0:STATS_blocks-1] "BOXPLOT/CPDEA_3" using (8*i+1):2 index i lt 1 lc rgb 'blue' title (i==0 ? 'CPDEA' : ''),\
     for [i=0:STATS_blocks-1] "BOXPLOT/MOEAD_3" using (8*i+2):2 index i lt 1 lc rgb 'red'title (i==0 ? 'MOEA/D' : ''),\
     for [i=0:STATS_blocks-1] "BOXPLOT/R2EMOA_3" using (8*i+3):2 index i lt 1 lc rgb 'green' title (i==0 ? 'R2-EMOA' : ''),\
     for [i=0:STATS_blocks-1] "BOXPLOT/CPDEA_3" using (8*i+1.5):(-1):xticlabel(1) index i w l notitle
