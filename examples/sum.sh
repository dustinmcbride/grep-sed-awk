#!/usr/bin/awk -f

BEGIN {FS = ","}

{ if ($1 == "1") {sum+=$4;}}

END {print sum}
