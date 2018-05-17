/* *****************************************
 * CSCI205 - Software Engineering and Design
 * Spring 2016
 *
 * Name: Andre Amirsaleh
 * Date: Mar 26, 2016
 * Time: 12:05:40 AM
 *
 * Project: csci205
 * Package: lab13
 * File: KelvinConvertController
 * Description: lab13b - Controller class
 *
 * ****************************************
 */
package lab13;

import lab13.KelvinConvertModel.TempUnits;

/**
 * Controller class - Keeps Model and View classes in sync
 *
 * @author Andre Amirsaleh
 */
public class KelvinConvertController {

    /**
     * Reference to the model
     */
    private KelvinConvertModel theModel;

    /**
     * Reference to the view
     */
    private MainView theView;

    /**
     * Constructs <code>KelvinCOnvertController</code> instance
     *
     * @param theModel Reference to the model
     * @param theView Reference to the view
     */
    public KelvinConvertController(KelvinConvertModel theModel, MainView theView) {
        this.theModel = theModel;
        this.theView = theView;
        updateViewFromModel();
    }

    private void updateViewFromModel() {
        if (theModel.getTempUnits() == TempUnits.FAH_TEMP) {
            theView.getRdbtnFahTemp().setSelected(true);
        } else {
            theView.getRdbtnCelTemp().setSelected(true);
        }
    }
}
