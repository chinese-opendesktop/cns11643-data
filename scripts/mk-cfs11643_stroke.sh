#!/usr/bin/bash

echo 'LC_COLLATE'
echo
echo 'copy "iso14651_t1_common"'
echo
echo 'script <HAN>'
echo
echo 'order_start <HAN>;forward;forward;forward;forward,position'

sort -n -k 2 ../properties/uni_stroke_sequence.txt |
sed -e 's/^0\(.*\) /<U\1> /' -e 's/^2\(.*\) /<U0002\1> /' |
sed 's/ /;IGNORE;IGNORE;IGNORE # /' |
sed 's/\(<.*>\)/\1 \1/'

echo '#'
echo 'order_end'
echo '#'
echo 'END LC_COLLATE'

