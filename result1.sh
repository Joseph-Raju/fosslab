#!/bin/bash

pdftotext -layout result_MDL1.pdf MDL1.txt
pdftotext -layout result_MDL2.pdf MDL2.txt

tr -d '\040\011\012\015\014' < MDL1.txt > temp1.txt
tr -d '\040\011\012\015\014' < MDL2.txt > temp2.txt

sed -i 's/MDL16CS/\nMDL16CS/g' temp1.txt
sed -i 's/MDL16CS/\nMDL16CS/g' temp2.txt
sed -i 's/ELECTRONICS/\nELECTRONICS/g' temp1.txt
sed -i 's/ELECTRONICS/\nELECTRONICS/g' temp2.txt

grep -v "APJ" temp1.txt >  temp11.txt
grep -v "ELECTRO" temp1.txt > temp11.txt
grep "MDL16CS" temp11.txt > cs1.txt


sed  's/MA101/ 4/g' temp11.txt > cs1.txt
sed -i 's/PH100(/ 4/g' cs1.txt
sed -i 's/BE110(/ 3/g' cs1.txt
sed -i 's/BE10105(/ 3/g' cs1.txt
sed -i 's/BE103(/ 3/g' cs1.txt
sed -i 's/EE100(/ 3/g' cs1.txt
sed -i 's/PH110(/ 1/g' cs1.txt
sed -i 's/EE110(/ 1/g' cs1.txt
sed -i 's/CS110(/ 1/g' cs1.txt
sed -i 's/O)/ 10/g' cs1.txt
sed -i 's/A+)/ 9/g' cs1.txt
sed -i 's/A)/ 8.5/g' cs1.txt
sed -i 's/B+)/ 8/g' cs1.txt
sed -i 's/B)/ 7/g' cs1.txt
sed -i 's/C)/ 6/g' cs1.txt
sed -i 's/P)/ 5/g' cs1.txt
sed -i 's/F)/ 0/g' cs1.txt
sed -i 's/,/ /g' cs1.txt

awk '{printf($1" "(($2 * $3) + ($4 * $5) + ($6 * $7) + ($8 * $9) + ($10 * $11) + ($12 * $13) + ($14 * $15) + ($16 * $17) + ($18 * $19))/23)}' cs1.txt > s1cal.txt
sed -i 's/MDL/\nMDL/g' s1cal.txt


sed -i 's/TCE/\nTCE/g' temp2.txt
grep "MDL16CS" temp2.txt > temp21.txt


sed  's/CY100(/ /g' temp21.txt > cs2.txt
sed -i 's/MA102(/ /g' cs2.txt
sed -i 's/BE100(/ /g' cs2.txt
sed -i 's/BE102(/ /g' cs2.txt
sed -i 's/CY110(/ /g' cs2.txt
sed -i 's/EC100(/ /g' cs2.txt
sed -i 's/EC110(/ /g' cs2.txt
sed -i 's/CS120(/ /g' cs2.txt
sed -i 's/CS100(/ /g' cs2.txt
sed -i 's/O)/ 10/g' cs2.txt
sed -i 's/A+)/ 9/g' cs2.txt
sed -i 's/A)/ 8.5/g' cs2.txt
sed -i 's/B+)/ 8/g' cs2.txt
sed -i 's/B)/ 7/g' cs2.txt
sed -i 's/C)/ 6/g' cs2.txt
sed -i 's/P)/ 5/g' cs2.txt
sed -i 's/F)/ 0/g' cs2.txt


sed -i 's/,/ /g' cs2.txt


awk '{printf($1" "(($2 * 4) + ($3 * 4) + ($4 * 3) + ($5 * 1) + ($6 * 1) + ($7 * 4) + ($8 * 3) + ($9 * 3) + ($10 * 1))/24)}' cs2.txt > s2cal.txt
  

sed -i 's/MDL/\nMDL/g' s2cal.txt

join -1 1 -2 1 s1cal.txt s2cal.txt > join.txt
awk '{printf($1" :" (($2*23) + ($3*24))/47)}' join.txt > CGPA.txt

sed -i 's/MDL/\nMDL/g' CGPA.txt



