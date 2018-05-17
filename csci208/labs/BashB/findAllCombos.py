#!/usr/local/bin/python

import sys

def findAllCombos( setOfChars, combo, comboLength ):
	if len( setOfChars ) < 1:
		if len( combo ) == comboLength:
			print( combo + " ", end="")
		else:
			return
	elif len( combo ) == comboLength:
		print( combo + " ", end="" )
	else:
		firstChar = setOfChars[0]
		restOfChars = setOfChars[1:]
		findAllCombos( restOfChars, str( combo ), comboLength )
		findAllCombos( restOfChars, str( combo + firstChar ), comboLength )

findAllCombos( sys.argv[1], "", int( sys.argv[2] ) )