MOEAD= "#99ffff"; CPDEA= "#4671d5"
#set terminal pngcairo
#set terminal postscript portrait enhanced mono dashed lw 1 "Helvetica" 14 
set terminal postscript enhanced 'Times' color 
set terminal postscript enhanced font "Helvetica" 18
set output "Models.eps" 
set key font ",18"
set yrange [0.0:0.42]
set xrange [0:1.0]

#set ylabel "Diversity Threshold"
set ylabel "Diversity Penalty Threshold (D)"
#set xlabel "Total Time (Maximum Number of Evaluations)"
set xlabel "Elapsed Period of Execution"
set title "Diversity Decay Models"
set autoscale xfix

set style fill solid 0.25 border -1
set style boxplot nooutliers pointtype 7
set style data boxplot
set boxwidth 0.5

#set format x "%.0f%%"
#unset cblabel
#set format cb "%g%%"
#set style function linespoints
DI=0.4
f(x) = DI - (DI*x)/0.5
g(x, y) = DI *(y**x) 
k(x,y) = DI*exp(-10*(x**y))
l(x,y) = ((DI*0.005)/(log(1+x)))+y
set xtics ("0%%" 0, "10%%" 0.1, "20%%" 0.2, "30%%" 0.3, "40%%" 0.4, "50%%" 0.5, "60%%" 0.6, "70%%" 0.7, "80%%" 0.8, "90%%" 0.9, "100%%" 1.0)

plot f(x) title 'Linear' dt 1, g(x, 0.001) title 'Geometric {/Symbol a}=0.001' dt 2, g(x, 0.0001) title 'Geometric {/Symbol a}=0.0001' dt 2, g(x, 0.00001) title 'Geometric {/Symbol a}=0.00001' dt 2, k(x,0.95) title 'Exponential {/Symbol b}=0.95' dt 4, k(x,1.5) title 'Exponential {/Symbol b}=1.5' dt 4, k(x,2.0) title 'Exponential {/Symbol b}=2.0' dt 4, l(x, -0.002) title 'Logarithmic {/Symbol b}=-0.02' dt 4, l(x, -0.005) title 'Logarithmic {/Symbol b}=-0.03' dt 4
