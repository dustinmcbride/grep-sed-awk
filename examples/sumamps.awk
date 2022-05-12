BEGIN {
  FS = ","
  printf "Summing...\n"
}

{
  if ($1 == circuit) {sum+=$4;}
}

END {print sum}
