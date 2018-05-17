/* *****************************************
* CSCI205 - Software Engineering and Design
* Spring 2016
* Instructor: Andre Amirsaleh
* Section: List time of your lecture
*
* Name: Andre Amirsaleh
* Date: 2/2/2016
*
* Lab / Assignment: lab04
*
* Description: Simple calculator for practice with switch statements
*
* *****************************************/

package lab04;

import java.util.Scanner;

/**
 * A class designed to give the user an opportunity to test a simple
 * calculator built with switch statements
 *
 * Date: 2016-Spring
 * @author aa026
 */
public class Calculator {

	/**
	 * Simple calculator method using Scanner object
	 */
	public static void calculate() {
		double operand1 = 0;
		String operator = "";
		double operand2 = 0;
		double result = 0;
		Scanner input = new Scanner( System.in );

		while ( true ) {
			System.out.print( "Enter a simple arithmetic expression with spacing: " );

			// Parse operand 1
			if ( input.hasNextDouble() ) {
				operand1 = input.nextDouble();
			} else {
				System.out.println( "ERROR: Cannot parse operand 1" );
				input.nextLine();
				continue;
			}

			// Get operator
			operator = input.next();

			// Parse operand 2
			if ( input.hasNextDouble() ) {
				operand2 = input.nextDouble();
			} else {
				System.out.println( "ERROR: Cannot parse operand 2" );
				input.nextLine();
				continue;
			}

			// Calculate!!!!!!
			switch ( operator ) {
				case "+":
					result = operand1 + operand2;
					System.out.printf( "The sum is %.3f\n", result );
					break;
				case "-":
					result = operand1 - operand2;
					System.out.printf( "The difference is %.3f\n", result );
					break;
				case "*":
					result = operand1 * operand2;
					System.out.printf( "The product is %.3f\n", result );
					break;
				case "/":
					result = operand1 / operand2;
					System.out.printf( "The quotient is %.3f\n", result );
					break;
				case "%":
					result = operand1 % operand2;
					System.out.printf( "The product is %.3f\n", result );
					break;
				case "^":
					result = Math.pow( operand1, operand2 );
					System.out.printf( "The power is %.3f\n", result );
					break;
				default:
					System.out.printf( "Error: %s is not a valid operator\n", operator );
					input.nextLine();
					continue;
			}

			System.out.print("Try again? [y | n] ");
			if ( ! input.next().equalsIgnoreCase( "y" ) ) {
				break;
			}
			input.nextLine();
		}
	}

	/**
	 * Main function which prompts the user for an input expression
	 * to evaluate
	 */
	public static void main( String[] args ) {
		System.out.println( "Welcome to the Calculator" );
		System.out.println( "Enter expressions with two numeric operands" );
		System.out.println( "and a single operator from +, -, *, /, %, or ^" );
		calculate();
		System.out.println( "Goodbye!" );
	}
}