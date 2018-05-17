/* *****************************************
 * CSCI205 - Software Engineering and Design
 * Spring 2016
 *
 * Name: Andre Amirsaleh
 * Date: 1/25/16
 *
 * Lab: Lab02, Exercise 2
 *
 * @author Brian King, 2012-Fall
 *
 * Description:
 * A simple program to ask the user for a temperature in F, and converts it to
 * Celsius.
 * *****************************************
 */

package lab02;

import java.util.Scanner;

public class FtoC {
	public static void main(String[] args) {

		String tryAgain = "n";
		while (true) {

			// Prompt user for a Fahrenheit temp
			System.out.print("Enter a temperature in Fahrenheit: ");

			// Create the Scanner object, attached to console input
			Scanner in = new Scanner(System.in);

			// Read and store the Fahrenheit temp
			int fahTemp = in.nextInt();

			// Convert the temp to Celsius
			double celTemp = 5.0 / 9 * (fahTemp - 32);

			// Output the results with correct formatting
			System.out.format( "%d F = %.1f C\n", fahTemp, celTemp);
			
			// Output response depending on temperature
			if (celTemp <= 0) {
				System.out.println("Brrr… it is FREEZING out!");
			} else if (celTemp <= 15) {
				System.out.println("It's a bit cool out");
			} else if (celTemp <= 30) {
				System.out.println("It's comfortably warm");
			} else {
				System.out.println("It's HOT! I need A/C!");
			}

			// Try again?
			System.out.print("Try again? [y | n]: ");
			Scanner sc = new Scanner(System.in);
			if (in.next().equalsIgnoreCase("n")) {
				break;
			}
		}
		System.out.println("Goodbye!");
	}
}
