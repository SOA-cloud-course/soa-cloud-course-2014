#
# author: Mikolaj Baranowski <baranowski@uva.nl>
#

set term png size 3000, 800
set output "tweetstats.png"
set xdata time
set timefmt "\"%Y-%m-%d %H:%M:%S\""
set xrange [*:*]
set style data lines
set xlabel "Time"
set ylabel "Number of tweets"
plot 'tweetstats.data' using 1:2 with lines t "positive" lc rgb "green" smooth bezier, 'tweetstats.data' using 1:3 with lines t "negative" lc rgb "red" smooth bezier
