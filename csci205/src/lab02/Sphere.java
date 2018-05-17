/* *****************************************
 * CSCI205 - Software Engineering and Design
 * Spring 2016
 *
 * Name: Andre Amirsaleh
 * Date: 1/26/16
 *
 * Lab: Lab02, Exercise 5
 *
 * @author Brian King, 2012-Fall
 *
 * Description:
 * A simple program to compute the volume of a sphere with a given radius
 * *****************************************
 */

package lab02;

import java.util.Scanner;

public class Sphere {
	public static void main(String[] args) {
		// Step 1: input radius
		Scanner in = new Scanner( System.in );
		System.out.print( "Enter the radius of your sphere: " );
		int radius = in.nextInt();

		// Step 2: Compute volume
		double volume = 4 / 3.0 * Math.PI * Math.pow( radius, 3 );

		// Step 4: output result
		System.out.printf( "The volume of your sphere is %.2f\n", volume );

		// Step 5: output rounded result
		System.out.println( "Rounded to the nearest integer, the volume of your sphere is " + Math.round( volume ) );
	}
}
