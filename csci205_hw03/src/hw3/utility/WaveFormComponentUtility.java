/* *****************************************
 * CSCI205 - Software Engineering and Design
 * Spring 2016 *
 * Name: Andre Amirsaleh and Nazmul Hossain
 * Date: Apr 4, 2016
 * Time: 8:16:58 PM *
 * Project: csci205_hw03
 * Package: hw3.utility
 * File: WaveFormComponentUtility
 * Description: Static methods for the WaveFormComponent class (in the hw3.view
 * package) to use
 * ****************************************
 */
package hw3.utility;

import java.util.ArrayList;

/**
 * Contains static utility methods for <code>WaveFormComponent</code>
 *
 * @author Andre Amirsaleh
 */
public class WaveFormComponentUtility {

    /**
     * Returns maximum absolute value of an <code>ArrayList</code> of
     * <code>Short</code> objects. Called in order to resize the data points so
     * that they fit in the scroll panel
     *
     * @param shortList List of shorts of which to find the maximum
     * @return Maximum absolute value of <code>shortList</code>
     * @author Andre Amirsaleh
     */
    public static short absMaxShort(ArrayList<Short> shortList) {
        short currMax = (short) Math.abs(shortList.get(0));
        for (short s : shortList) {
            if (Math.abs(s) > currMax) {
                currMax = s;
            }
        }
        return currMax;
    }
}
