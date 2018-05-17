# Assignment: Homework 2, Problem 5
# Authors: Andre Amirsaleh and Stefano Cobelli
#
# Date: 9/12/16
# Class: CSCI 208 - Programming Language Design
# Section: 2:00PM-3:00PM
# Professor: Benoit Razet

print( "We do not have to declare variable types, so we can execute commands like..." )
x = 5
print( "x = 5" )
y = "Stefano"
print( "y = \"Stefano\"" )
print()

# Changing a variable's type
print( "We can even change the type of the variable after it has been initialized..." )
x = "Hello"
print( "x = \"Hello\"" )
x = 'c'
print( "x = 'c'" )
x = 0.22
print( "x = 0.22" )
y = False
print( "y = False" )
print()

print( "A Python list can hold values of several different types..." )
myList = [ 10, "hello", True, 11.0 ]
print( "myList = [ 10, \"hello\", True, 11.0 ]" )
print()

print( "Python even allows us to run a for-each loop on a list of differently typed elements..." )
for element in myList:
	print( element )