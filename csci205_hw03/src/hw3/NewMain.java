/* *****************************************
 * CSCI205 - Software Engineering and Design
 * Spring 2016 *
 * Name: Andre Amirsaleh and Nazmul Hossain
 * Date: Apr 1, 2016
 * Time: 9:32:51 PM *
 * Project: csci205_hw03
 * Package: hw3
 * File: NewMain
 * Description: Launches the program!
 * ****************************************
 */
package hw3;

import hw3.controller.MainController;
import hw3.model.WaveForm;
import hw3.model.WaveFormException;
import hw3.utility.AudioUtility;
import hw3.view.MainView;

/**
 * Contains main method to launch the program
 *
 * @author Andre Amirsaleh
 */
public class NewMain {

    /**
     * Main method to launch the Program
     *
     * @param args the command line arguments
     * @throws hw3.model.WaveFormException
     */
    public static void main(String[] args) throws WaveFormException {
        MainView theView = new MainView();
        WaveForm theModel = new WaveForm(theView.getFreq(),
                                         theView.getSampleRate(),
                                         theView.getSampleSizeType(),
                                         theView.getLengthInSec());
        MainController theController = new MainController(theView, theModel);
        theController.getTheView().setVisible(true);
        AudioUtility.printAudioFormat(theController.getTheModel().getFormat());
    }
}
