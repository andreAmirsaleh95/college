/* *****************************************
* CSCI205 - Software Engineering and Design
* Spring 2016
*
* Name: Andre Amirsaleh
* Date: Feb 15, 2016
* Time: 1:34:34 PM
*
* Project: csci205
* Package: lab09
* File: ExceptionExample
* Description: Practice with exceptions
*
* ****************************************
 */
package lab09;

import java.util.InputMismatchException;
import java.util.Scanner;

/**
 *
 * @author Andre Amirsaleh
 */
public class ExceptionExample {

    public static final int SIZE = 10;

    public static void main(String[] args) {
        Scanner in = new Scanner(System.in);
        int[] x = new int[SIZE];
        int i = 0;
        do {
            try {
                System.out.print(
                        "Enter an index to fill, or " + SIZE + " to finish: ");
                i = in.nextInt();
                if (i != SIZE) {
                    x[i] = i;
                }
            } catch (ArrayIndexOutOfBoundsException e) {
                System.out.println(i + " is out of range! Try again!");
                continue;
            } catch (InputMismatchException e) {
                System.out.println("Please enter integers! Try again!");
                in.nextLine();
                continue;
            }

        } while (i != SIZE);
    }
}
