MOEAD= "#99ffff"; CPDEA= "#4671d5"
#set terminal pngcairo
#set terminal postscript portrait enhanced mono dashed lw 1 "Helvetica" 14 
set terminal postscript enhanced 'Times' color 
set terminal postscript enhanced font "Helvetica" 22
set output "initial_distance_factor_2obj.eps" 
set key font ",18"
set yrange [0.84:0.96]
set ylabel "Normalized HV"
set xlabel "Initial Threshold Value"
set title "Problems with two objectives"
set autoscale xfix

set xtics 0,0.1,1.0
set style fill solid 0.25 border -1
set style boxplot nooutliers pointtype 7
set style data boxplot
set boxwidth 0.05

stats "BOXPLOT/VSDMOEA_2" using 2 nooutput
#
#plot for [i=0:STATS_blocks-1] "BOXPLOT/VSDMOEA_2" using (3*i):2 index i lt 1 title (i==0 ? 'VSD-MOEA' : ''),\
#     for [i=0:STATS_blocks-1] "BOXPLOT/CPDEA_2" using (3*i+1):2 index i lt 1 title (i==0 ? 'CPDEA' : ''),\
#     for [i=0:STATS_blocks-1] "BOXPLOT/CPDEA_2" using (3*i+0.5):(-1):xticlabel(1) index i w l notitle
#plot for [i=0:STATS_blocks-1] "BOXPLOT/VSDMOEA_2" using (6*i):2 index i lt 1 lc rgb 'white'title (i==0 ? 'VSD-MOEA' : '')
plot for [i=0:STATS_blocks-1] "BOXPLOT/VSDMOEA_2" using (0.1*i):2 index i lt 1 lc rgb 'white'title ""
#     for [i=0:STATS_blocks-1] "BOXPLOT/0.1" using (6*i+1):2 index i lt 1 lc rgb 'blue' title (i==0 ? 'CPDEA' : ''),\
#     for [i=0:STATS_blocks-1] "BOXPLOT/0.2" using (6*i+2):2 index i lt 1 lc rgb 'red'title (i==0 ? 'MOEA/D' : ''),\
#     for [i=0:STATS_blocks-1] "BOXPLOT/0.3" using (6*i+3):2 index i lt 1 lc rgb 'green' title (i==0 ? 'R2-EMOA' : ''),\
#     for [i=0:STATS_blocks-1] "BOXPLOT/0.4" using (6*i+2):(-1):xticlabel(1) index i w l notitle
