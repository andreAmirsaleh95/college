/*
 * Assignment: Homework 2, Problem 1
 * Authors: Andre Amirsaleh and Stefano Cobelli
 *
 * Date: 9/12/16
 * Class: CSCI 208 - Programming Language Design
 * Section: 2:00PM-3:00PM
 * Professor: Benoit Razet
 */

/**
 *
 * @author Andre Amirsaleh and Stefano Cobelli
 */
public class Prob1 {

    public enum Days {
        SUNDAY, MONDAY, TUESDAY, WEDNESDAY,
        THURSDAY, FRIDAY, SATURDAY
    }

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {

        System.out.println("PROBLEM 1:");

        // Enum
        System.out.println("Java supports enums...");
        Days sunday = Days.SUNDAY;
        //Days monday = Days.MONDAY;
        System.out.println("From the enum Day: The week starts on a " + sunday);
        System.out.println(
                "Enums are automatically indexed with integers starting at 0, so they are ordinal.");
        for (int i = 0; i < 3; i++) {
            System.out.println(Days.values()[i]);
        }

        // Subrange
        System.out.println(
                "Java does not support subranges\nNothing comprable to Python's range(0,10)");

        // Cartesian product
        System.out.println("Java does not support cartesian products.");

        // Union types:
        System.out.println("Java does not support union types.");

        // ARRAYS:
        int[] iArray = {10, 11, 12};
        System.out.println("Java supports arrays...");
        System.out.println("Indexes start at 0");
        for (int i = 0; i < iArray.length; i++) {
            System.out.println("iArray[" + i + "] = " + iArray[i]);
        }
    }
}
