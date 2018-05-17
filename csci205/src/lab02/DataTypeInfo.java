/* *****************************************
 * CSCI205 - Software Engineering and Design
 * Spring 2016
 *
 * Name: YOUR NAME
 * Date: ??/??/????
 *
 * Lab: Lab02, Exercise 1
 *
 * Description:
 * The following is a simple program to illustrate differences between the
 * primitive types, and use the wrapper classes to gain some information about
 * those types
 * *****************************************
 */

package lab02;

public class DataTypeInfo {

    public static void main(String[] args) {
        byte minByte = Byte.MIN_VALUE, maxByte = Byte.MAX_VALUE;
        System.out.println("The minimum byte value is " + minByte);
        System.out.println("The maximum byte value is " + maxByte);
        System.out.println("The size of byte is " + Byte.SIZE);

        short minShort = Short.MIN_VALUE, maxShort = Short.MAX_VALUE;
        System.out.println("The minimum short value is " + minShort);
        System.out.println("The maximum short value is " + maxShort);
        System.out.println("The size of short is " + Short.SIZE);

        // Add the same code for int, long, float and double
	int minInt = Integer.MIN_VALUE, maxInt = Integer.MAX_VALUE;
	System.out.println("The minimum integer value is " + minInt);
	System.out.println("The maximum integer value is " + maxInt);
	System.out.println("The size of integer is " + Integer.SIZE);
	
	long minLong = Long.MIN_VALUE, maxLong = Long.MAX_VALUE;
	System.out.println("The minimum long value is " + minLong);
	System.out.println("The maximum long value is " + maxLong);
	System.out.println("The size of long is " + Long.SIZE);

	float minFloat = Float.MIN_VALUE, maxFloat = Float.MAX_VALUE;
	System.out.println("The minimum float value is " + minFloat);
	System.out.println("The maximum float value is " + maxFloat);
	System.out.println("The size of long is " + Long.SIZE);

	double minDouble = Double.MIN_VALUE, maxDouble = Double.MAX_VALUE;
	System.out.println("The minimum double vlue is " + minDouble);
	System.out.println("The maximum double value is " + maxDouble);
	System.out.println("The size of double is " + Double.SIZE);
    }
}
