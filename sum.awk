BEGIN {FS = ","}

{ if ($1 == circuit ) {sum+=$4;}}

END {print sum}

