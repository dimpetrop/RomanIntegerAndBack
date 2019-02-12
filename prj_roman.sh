#!/bin/bash
########
#
#  The below code is distributed under the MIT license
#  Code can found on github.com/dimpetrop (personal github) after deadline
#
########

for ((i= 0; i<6;i++)); do echo; done  #Leave some white space


echo Welcome
echo Please enter an integer or roman number
read input

roman=( "M" "CM" "D" "CD" "C" "XC" "L" "XL" "X" "IX" "V" "IV" "I" )
integers=( 1000 900 500 400 100 90 50 40 10 9 5 4 1 )

#Finding the appropriate conversion type (FromNumberToRoman or FromRomanToNumber)   -  similar to python   if input in roman[:]  -
i=-1
while [[ i -lt 13 ]]
do
	((i++))  #iterating thru roman array
	if [[ ${input[0]} -eq ${roman[i]} ]]  #comparing first element of input with roman elements
	then
		option=2
		break
	else
		option=1
		break
	fi
done


#Main Program Code Starting here \/
if [[ $option -eq 1 ]]
then
	result=""
	i=-1
	j=-1
	c=0

	#FromNumberToRoman
	while [[ c -lt 13 ]]  #This will be done 13 - exactly how many times elements on the two arrays appear
	do
		((i++)) #iterating thru integers array
		((j++)) #iterating thru roman array
	  ((c++)) #avoid autonomous

		while [[ $input -ge ${integers[i]} ]]  #Comparing user input with every element of the integers array
		do
			result="$result${roman[j]}"  #As i and j are parallel, concatenate roman number
			input=$((input-integers[i])) #Substract integer from input

		done
	done

	echo $result #Show result

#FromRomanToNumber
else
	if [[ $option -eq 2 ]]
	then
		index=0
		result=0

		i=-1
		j=-1
		c=0

		while [[ c -lt 13 ]] #This will be done 13 - exactly how many times elements on the two arrays appear
		do
			((i++)) #iterating thru integers array
			((j++)) #iterating thru roman array
			((c++)) #avoid autonomous

			len=${#roman[j]} #Getting the length of roman[j] i.e if roman[j] is VI the length is 2 and vice versa

			while [[ ${input[@]:index:len} == ${roman[i]} ]]  #Comparing the user input from index to len (similar to python array[0:1] etc) with the roman number
			do

				result=$((result+integers[i]))   #Add integers[i] value to result
				((index+=len)) #Add the previous len to index

			done
		done

		echo $result #Show result

	fi
fi
exit
