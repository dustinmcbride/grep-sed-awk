
## Grep

### Simple search
grep "rug" the_big_leboski.txt

### Show total count
grep -c "rug" the_big_leboski.txt

### Show total count (ignore case)
grep -c -i "rug" the_big_leboski.txt

### With line numbers
grep -n "rug" the_big_leboski.txt

### With context
grep -B4 -A4 "rug" the_big_leboski.txt

### Negate Search
grep -v -i "rug" the_big_leboski.txt

### Two terms same line
cat the_big_leboski.txt | grep "rug"
grep "rug" the_big_leboski.txt | grep 'Dude'

### Print file names
grep -rni "rug" *
r = recursive i.e, search subdirectories within the current directory
n = to print the line numbers to stdout
i = case insensitive search

### With Tree
find . | grep lodash

### Quick note on egrep
ls -l | grep "rb|txt"


## Sed

### Takes a -e or -i
where e is the following script
or i is a file sed.in

### Make PG-13
sed -e 's/.ucking/ducking/g' the_big_leboski.txt

### General Form is
echo "\n\n
sed -e '/pattern/ command' my_file
'command' can be one of
's' = search & replace
'p' = print,
'd' = delete,
'i' = insert,
'a' = append
\n"

### Explicit Printing
Note that the default action is to print all lines including those that do not match,
so if you want to suppress this you need to invoke sed with the '-n' flag and then you
can use the 'p' command to control what is printed.

### Print only directories
ls -l | sed -n -e '/^d/ p'

### Delete comments
sed -e '/s*#/ d' comments.rb

### Replace text only if other text is found
sed  -e '/Volts/ s/number/120/; /Amps/ s/number/2/; /Watts/ s/number/240/;' electricity.txt

### Show range of lines
sed -n '5,10p' the_big_leboski.txt

### Pattern match
sed  -n -e '/DONNY/,/^$/ p' the_big_leboski.txt

p 'Reservation ===', object.reservation, '==='

docker-compose logs -f --tail 10 | sed -n -e '/===/,/===/ p'

### With grep (for color)
docker-compose logs -f --tail 10 | sed -n -e '/===/,/===/ p' | grep unit_id



## AWK

### Like grep
When given a pattern it will return the matching lines
awk /Dude/ the_big_leboski.txt

### Awk Forkflow
echo "\n\n
BEGIN {code}
{code}
END {code}
\n\n"

### Basic Usage (use circuits.text)
When given code it will execute the code for each line
awk '{print}' circuits.txt

### Using Line Varibles
awk '{print $2}' circuits.txt

### Using a differ delimiter
awk '{print $2}' circuits.csv
awk -F',' '{print $2}' circuits.csv

### Formatting
awk  -F',' '{print $1 "\t" $2 "\t" $3 "\t" $4}' circuits.csv

### Using BEGIN
awk -F',' 'BEGIN{print "Circuit\tRoom\tUse\tAmp Draw"} {print}' circuits.csv

### Better Formatting Data
awk -F',' 'BEGIN{print "Circuit\tRoom\tUse\tAmp"} {print $1 "\t" $2 "\t" $3 "\t" $4}' circuits.csv

### Computing Data on the fly
awk -F',' 'BEGIN{print "Circuit\tRoom\tUse\tAmp\tWatts"} {print $1 "\t" $2 "\t" $3 "\t" $4 "\t" $4 * 120}' circuits.csv

### Sum a column
awk -F',' '{sum+=$4;} END {print sum}' circuits.csv
awk -F',' '{ if ($1 == "1") {sum+=$4;}} END {print sum}' circuits.csv

### Create a file
awk -f sum.awk circuits.csv
awk sum.awk -v circuit=2 circuits.csv

### Back to our logs example
docker-compose logs -f --tail 10 | sed -n -e '/===/,/===/ p' | awk '{print $0"\n"}' | grep unit_id

