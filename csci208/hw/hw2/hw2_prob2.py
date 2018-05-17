# Assignment: Homework 2, Problem 5
# Authors: Andre Amirsaleh and Stefano Cobelli
#
# Date: 9/12/16
# Class: CSCI 208 - Programming Language Design
# Section: 2:00PM-3:00PM
# Professor: Benoit Razet
#
# Works Cited:
# 1. https://docs.python.org/3/library/enum.html

from enum import Enum

class Days (Enum) :
	sunday = 1
	monday = 2
	tuesday = 3

print( "Special fields (name and value):" ) # [1]
print( str( Days.sunday.name ) + ": " + str( Days.sunday.value ) )
print( str( Days.monday.name ) + ": " + str( Days.monday.value ) )
print( str( Days.tuesday.name ) + ": " + str( Days.tuesday.value ) )
print()

# Ordinal?
print( "Python's enums are not ordinal." ) # [1]

# Comparable?
print( "Python's enums are comparable..." ) # [1]
print( "Days.sunday is Days.tuesday" + str( Days.sunday is Days.tuesday ) )
print( str( Days.sunday is Days.tuesday ) )

# Integer values? Special fields /functions?
print( "Python's enums are not true integer values, nor do they have special fields or functions" ) # [1]