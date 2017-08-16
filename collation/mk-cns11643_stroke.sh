#!/usr/bin/bash
echo '# This file is part of the GNU C Library and contains locale data.'
echo '# The Free Software Foundation does not claim any copyright interest'
echo '# in the locale data contained in this file.  The foregoing does not'
echo '# affect the license of the GNU C Library as a whole.  It does not'
echo '# exempt you from the conditions of the license if your use would'
echo '# otherwise be governed by that license.'
echo
echo '################################################################################'
echo '#'
echo '# Collation for Hanzi(chinese characters) by component and stroke'
echo '#'
echo '# Original data from CNS11643 at http://www.cns11643.gov.tw/'
echo '# License: Open Government Data License 1.0 (compatible with the CC BY 4.0)'
echo '#'
echo '# Prepared and contributed to glibc by Wei-Lun Chao <bluebat@member.fsf.org>'
echo '# Project at https://github.com/chinese-opendesktop/cns11643-data'
echo '#'
echo '################################################################################'
echo
echo 'LC_COLLATE'
echo
echo 'copy "iso14651_t1_common"'
echo
echo 'script <HAN>'
echo
echo 'order_start <HAN>;forward;forward;forward;forward,position'

sort -n -k 2 cns11643_stroke.txt |
sed -e 's/^0\(.*\) /<U\1> /' -e 's/^2\(.*\) /<U0002\1> /' |
sed 's/ /;IGNORE;IGNORE;IGNORE # /' |
sed 's/\(<.*>\)/\1 \1/'

echo '#'
echo 'order_end'
echo '#'
echo 'END LC_COLLATE'
