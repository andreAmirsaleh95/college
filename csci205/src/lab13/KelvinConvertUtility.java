/* *****************************************
 * CSCI205 - Software Engineering and Design
 * Spring 2016
 *
 * Name: Andre Amirsaleh
 * Date: Mar 25, 2016
 * Time: 11:45:45 PM
 *
 * Project: csci205
 * Package: lab13
 * File: KelvinConvertUtility
 * Description: lab13b - Utility class
 *
 * ****************************************
 */
package lab13;

/**
 * Utility class - contains methods for converting temperatures between scales
 *
 * @author Andre Amirsaleh
 */
public class KelvinConvertUtility {

    /**
     * Converts a temperature from Celsius to Kelvin
     *
     * @param celTemp Temperature in Celsius
     * @return Temperature in Kelvin
     */
    public static double convertCtoK(double celTemp) {
        return 273.15 + celTemp;
    }

    /**
     * Converts a temperature (<code>String</code>) from Celsius to Kelvin
     *
     * @param celTemp Temperature in Celsius as a <code>String</code>
     * @return Temperature in Kelvin as a <code>String</code>
     */
    public static String strConvertCtoK(String celTemp) {
        Double c = Double.valueOf(celTemp);
        return Double.toString(convertCtoK(c));
    }

    /**
     * Converts a temperature from Fahrenheit to Kelvin
     *
     * @param fahTemp Temperature in Fahrenheit
     * @return Temperature in Kelvin
     * @see
     * http://www.rapidtables.com/convert/temperature/how-fahrenheit-to-kelvin.htm
     */
    public static double convertFtoK(double fahTemp) {
        return (459.67 + fahTemp) * 5.0 / 9.0;
    }

    /**
     * Converts a temperature (<code>String</code>) from Fahrenheit to Kelvin
     *
     * @param fahTemp Temperature in Fahrenheit as a <code>String</code>
     * @return Temperature in Kelvin as a <code>String</code>
     */
    public static String strConvertFtoK(String fahTemp) {
        Double f = Double.valueOf(fahTemp);
        return Double.toString(convertCtoK(f));
    }
}
