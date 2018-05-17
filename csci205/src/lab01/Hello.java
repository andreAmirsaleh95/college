/* *****************************************
* CSCI205 - Software Engineering and Design
* Spring 2016
* Instructor: Brian King
* Section: List time of your lecture
*
* Name: Andre Amirsaleh
* Date: 1/22/2016
*
* Lab / Assignment:
*
* Description:
* A basic "Hello, World" program in java to satisfy part of lab01
* *****************************************/

package lab01;

public class Hello
{
	public static void main( String[] args ){
		long startTime = System.nanoTime();
		System.out.println("Programming is not a spectator sport!");
		double estimatedTime = (System.nanoTime() - startTime)/1000000.0;
		String stringTime = Double.toString(estimatedTime);
		System.out.println("Estimated time to compute: " + stringTime + " ms");
		System.exit(0);
	}
}
