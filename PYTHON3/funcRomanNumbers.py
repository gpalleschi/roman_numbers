#!/usr/bin/python3

def decimalToRoman ( number ):
	RN = ["I","IV","V","IX","X","XL","L","XC","C","CD","D","CM","M"]
	VRN = [1,4,5,9,10,40,50,90,100,400,500,900,1000]
	div = 0
	ind = len(RN)-1
	retRN = ""

	while number > 0:
		div = number//VRN[ind]
		number=number%VRN[ind]

		while div :
			retRN = retRN + RN[ind]
			div-=1
		
		ind-=1
	return retRN

def romanToDecimal ( RN ):
	retDEC = 0
	ind = 0;
	for letter in list(RN):
		if letter == "I":
			retDEC+=1
		elif letter == "V":
			retDEC+=5
		elif letter == "X":
			retDEC+=10
		elif letter == "L":
			retDEC+=50
		elif letter == "C":
			retDEC+=100
		elif letter == "D":
			retDEC+=500
		elif letter == "M":
			retDEC+=1000
		else:
			return -1
		if ind > 1:
			if ( RN[ind] == 'V' or RN[ind] == 'X') and RN[ind - 1] == 'I':
				retDEC -= 1 + 1
			elif ( RN[ind] == 'L' or RN[ind] == 'C') and RN[ind - 1] == 'X':
				retDEC -= 10 + 10
			elif ( RN[ind] == 'D' or RN[ind] == 'M') and RN[ind - 1] == 'C':
				retDEC -= 100 + 100
		ind+=1
	return retDEC

#
# TO TEST
#
#decToConv = 2834 
#romToDec = decimalToRoman(decToConv)
#print(str(decToConv) + " ==> " + romToDec)
#print(romToDec + " ==> " + str(romanToDecimal(romToDec)))

