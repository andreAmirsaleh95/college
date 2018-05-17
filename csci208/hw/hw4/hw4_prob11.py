class Human:
	def walk(self):
		print("Ayy, I'm walkin' here!")
class Month:
	def walk(self):
		print("I'm walking, so I might as well be human!")

def main(aHuman):
	aHuman.walk()

main(Human())
main(Month())
