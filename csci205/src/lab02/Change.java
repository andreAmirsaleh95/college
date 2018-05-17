/* *****************************************
 * CSCI205 - Software Engineering and Design
 * Spring 2016
 *
 * Name: YOUR NAME
 * Date: ??/??/????
 *
 * Lab: Lab02, Exercise 4
 *
 * Description:
 * This is a simple program to compute a proper amount of change given some
 * number of pennies.
 *
 * @author BRK 2012-fall, with slight modifications in 2015
 */

package lab02;

import java.util.Scanner;
import java.util.Formatter;

public class Change {

	final static int PENNIES_PER_NICKEL = 5;
	final static int PENNIES_PER_DIME = 10;
	final static int PENNIES_PER_QUARTER = 25;
	final static int PENNIES_PER_DOLLAR = 100;

    public static void main(String[] args) {
        Scanner in = new Scanner(System.in);
		while (true) {
        	System.out.printf("Enter the number of pennies: ");

        	int pennies = in.nextInt();
			int originalPennies = pennies;

			// Compute number of dollars
			int dollars = pennies / PENNIES_PER_DOLLAR;
			pennies %= PENNIES_PER_DOLLAR;

			// Compute number of quarters
			int quarters = pennies / PENNIES_PER_QUARTER;
			pennies %= PENNIES_PER_QUARTER;

			// Compute number of dimes
			int dimes = pennies / PENNIES_PER_DIME;
			pennies %= PENNIES_PER_DIME;
		
			// Compute number of nickels
			int nickels = pennies / PENNIES_PER_NICKEL;
			pennies %= PENNIES_PER_NICKEL;

			// Output the results
			System.out.printf("%d pennies breaks down to:\n", originalPennies);
			System.out.printf("%4d %-8s = $%5.2f\n", dollars, "dollars", (double) dollars); //dollars
			System.out.printf("%4d %-8s = $%5.2f\n", quarters, "quarters", quarters * PENNIES_PER_QUARTER / (double) PENNIES_PER_DOLLAR); //quarters
			System.out.printf("%4d %-8s = $%5.2f\n", dimes, "dimes", dimes * PENNIES_PER_DIME / (double) PENNIES_PER_DOLLAR); // dimes
			System.out.printf("%4d %-8s = $%5.2f\n", nickels, "nickels", nickels * PENNIES_PER_NICKEL / (double) PENNIES_PER_DOLLAR); // nickels
			System.out.printf("%4d %-8s = $%5.2f\n", pennies, "pennies", pennies / (double) PENNIES_PER_DOLLAR); // pennies

			// Try again?
			System.out.print("Try again? [y | n]: ");
			if (in.next().equalsIgnoreCase("n")) {
				break;
			}
		}
		System.out.println("Goodbye!");
    }
}
