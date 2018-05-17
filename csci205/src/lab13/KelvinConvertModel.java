/* *****************************************
 * CSCI205 - Software Engineering and Design
 * Spring 2016
 *
 * Name: Andre Amirsaleh
 * Date: Mar 25, 2016
 * Time: 11:18:30 PM
 *
 * Project: csci205
 * Package: lab13
 * File: KelvinConvertModel
 * Description: lab13b - Model Class
 *
 * ****************************************
 */
package lab13;

import javax.swing.BoundedRangeModel;
import javax.swing.DefaultBoundedRangeModel;

/**
 *
 * @author Andre Amirsaleh
 */
public class KelvinConvertModel {

    /**
     * Represents the current temperature unit
     */
    public static enum TempUnits {
        FAH_TEMP, CEL_TEMP;
    }

    /**
     * Temperature to convert to Kelvin
     */
    private double tempToConvert;

    /**
     * Units for <code>tempToConvert</code> value
     */
    private TempUnits tempUnits;

    /**
     * Data model provided by the Swing library
     */
    private BoundedRangeModel tempRange;

    /**
     * Constructs a new KelvinConvertModel instance
     *
     */
    public KelvinConvertModel() {
        this.tempToConvert = 25.0;
        this.tempUnits = TempUnits.FAH_TEMP;
        this.tempRange = new DefaultBoundedRangeModel((int) tempToConvert, 0, 0,
                                                      100);
    }

    /**
     * Returns <code>tempToConvert</code> attribute
     *
     * @return Temperature to convert to Kelvin
     */
    public double getTempToConvert() {
        return tempToConvert;
    }

    /**
     * Returns <code>tempUnits</code> attribute
     *
     * @return Units of the temperature (<code>tempToConvert</code>) to convert
     * to Kelvin
     */
    public TempUnits getTempUnits() {
        return tempUnits;
    }

    /**
     * Returns <code>tempRange</code> attribute
     *
     * @return Data model provided by the Swing library
     */
    public BoundedRangeModel getTempRange() {
        return tempRange;
    }

    /**
     * Sets <code>tempToConvert</code> attribute
     *
     * @param tempToConvert Temperature to convert to Kelvin
     */
    public void setTempToConvert(double tempToConvert) {
        this.tempToConvert = tempToConvert;
    }

    /**
     * Sets <code>tempUnits</code> attribute
     *
     * @param tempUnits Units for <code>tempToConvert</code> value
     */
    public void setTempUnits(TempUnits tempUnits) {
        this.tempUnits = tempUnits;
    }

    /**
     * Sets <code>tempRange</code> attribute
     *
     * @param tempRange Data model provided by the Swing library
     */
    public void setTempRange(BoundedRangeModel tempRange) {
        this.tempRange = tempRange;
    }
}
