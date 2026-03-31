# Gnuplot script for SWT paper figures

set terminal png size 1200,800
set datafile separator ','

# Figure 1: Mertens with envelope
set output 'fig1_mertens.png'
set title 'M(x)/√x — Mertens Function (1000 zeros)'
set xlabel 'log_{10}(x)'
set ylabel 'M(x)/√x'
plot 'mertens_1000.csv' using 1:2 with lines title 'Reconstruction', \
     '' using 1:8 with lines lc 'red' title 'Envelope', \
     '' using 1:9 with lines lc 'red' notitle, \
     1.0 with lines lc 'black' dt 2 title 'Mertens bound'

# Figure 2: Envelope growth
set output 'fig2_envelope_growth.png'
set title 'Amplitude Sum Growth — Σ|A_n| vs Number of Zeros'
set xlabel 'Number of zeros'
set ylabel 'Σ|A_n|'
set logscale x
plot 'envelope_growth.csv' using 1:3 with linespoints title 'Mertens', \
     '' using 1:4 with linespoints title 'Liouville', \
     1.0 with lines lc 'black' dt 2 title '|M|>1 threshold'

# Figure 3: Wave decomposition at Pólya breach
set output 'fig3_waves_polya.png'
unset logscale
set title 'Wave Decomposition at Pólya Breach (10^9)'
set xlabel 'log_{10}(x)'
set ylabel 'Contribution'
plot 'waves_at_polya.csv' using 1:2 with lines lw 2 title 'Total', \
     '' using 1:3 with lines title 'γ_1=14.1', \
     '' using 1:4 with lines title 'γ_2=21.0', \
     '' using 1:5 with lines title 'γ_3=25.0', \
     0 with lines lc 'black' dt 2 notitle

# Figure 4: Convergence
set output 'fig4_convergence.png'
set title 'Reconstruction Convergence with Wave Count'
plot 'convergence.csv' using 1:2 with lines title '5 waves', \
     '' using 1:4 with lines title '20 waves', \
     '' using 1:6 with lines title '100 waves', \
     '' using 1:7 with lines title '500 waves'
