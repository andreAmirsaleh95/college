// Andre Amirsaleh

/** Contains all of the code for a game of hangman */
object TheGame {

	var theWord = "hangman"

	/** main method containing the game loop */
	def main(args: Array[String]) {
		var isLooping: Boolean = true
		var iteration: Int = 1
		while (isLooping) {
			if (1 == iteration) {
				initializeThings()
			}
			iteration = iteration + 1
		}
	}

	def initializeThings() {
		// Collect the word from Player1
		println("Welcome to hangman")
		println("Player1, enter the word for Player2 to guess.")
		theWord = scala.io.StdIn.readLine()

		// Draw things
		var i: Int = 0
		while (i < theWord.length) {
			print("_ ")
			i = i + 1
		}
		println()
	}
}