/* *****************************************
 * CSCI205 - Software Engineering and Design
 * Spring 2016 *
 * Name: Andre Amirsaleh and Nazmul Hossain
 * Date: Apr 1, 2016
 * Time: 8:00:44 PM *
 * Project: csci205_hw03
 * Package: hw3.controller
 * File: MainController
 * Description: Following MVC design pattern, this "controller" class mediates
 * information between the model (WaveForm) and the view (MainView). This is the
 * primary (and only) controller class, which contains an action handler (inner)
 * class for every action a user may generate.
 * ****************************************
 */
package hw3.controller;

import hw3.model.WaveForm;
import hw3.model.WaveFormException;
import hw3.utility.AudioUtility;
import hw3.view.DialogBoxNew;
import hw3.view.MainView;
import hw3.view.WaveFormComponent;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.io.File;
import java.io.IOException;
import javax.sound.sampled.LineUnavailableException;
import javax.sound.sampled.UnsupportedAudioFileException;
import javax.swing.JFileChooser;

/**
 * Primary controller class. Contains an action handler class for every action a
 * user may generate.
 *
 * @author Andre Amirsaleh and Nazmul Hossain
 * @see http://www.newthinktank.com/2013/02/mvc-java-tutorial/
 */
public class MainController {

    /**
     * GUI object which reflects the data contained in <code>theModel</code>
     *
     * @author Andre Amirsaleh
     */
    private MainView theView;

    /**
     * Contains data to display on <code>theView</code> (GUI)
     *
     * @author Andre Amirsaleh
     */
    private WaveForm theModel;

    /**
     * Constructs a <code>MainController</code> instance
     *
     * @param theView GUI object which reflects the data contained in
     * <code>theModel</code>
     * @param theModel Contains data to display on <code>theView</code> (GUI)
     * @author Andre Amirsaleh
     */
    public MainController(MainView theView, WaveForm theModel) {
        this.theView = theView;
        this.theModel = theModel;

        // Add waveform image to the correct panel in theView:
        WaveFormComponent image = new WaveFormComponent(this.theModel);
        this.theView.setWaveImage(image);

        // Add listeners for the "File" drop-down menu:
        this.theView.addNewListener(new NewListener());
        this.theView.addOpenListener(new OpenListener());
        this.theView.addExitListener(new ExitListener());

        // Add listeners for the "New Waveform" pop-up window buttons:
        ((DialogBoxNew) this.theView.getDialogBoxNew()).addOkListener(
                new OkNewListener());
        ((DialogBoxNew) this.theView.getDialogBoxNew()).addCancelListener(
                new CancelNewListener());

        // Add listeners for remaining buttons:
        theView.addPlayListener(new PlayListener());
        theView.addZoomInListener(new ZoomInListener());
        theView.addZoomOutListener(new ZoomOutListener());
        /*System.out.println(
         "Width of scroll panel =  " + theView.getWavePanel().getWidth());
         System.out.println(
         "Height of scroll panel = " + theView.getWavePanel().getHeight());*/
    }

    /**
     * Listens for the "Zoom In x 2" button in <code>theView</code>
     *
     * @author Andre Amirsaleh
     */
    class ZoomInListener implements ActionListener {

        /**
         * Zooms in on the image of the waveform
         * (<code>WaveFormComponent</code>)
         *
         * @param e <code>theView</code>'s <code>zoomInButton</code> (attribute)
         * is clicked
         * @author Andre Amirsaleh
         */
        @Override
        public void actionPerformed(ActionEvent e) {
            theView.getWaveImage().setNumIterations(
                    theView.getWaveImage().getShorts().size() / 2);
            theView.getWaveImage().setIterationFactor(
                    theView.getWaveImage().getIterationFactor() * 2);
            theView.getWavePanel().setViewportView(theView.getWaveImage());
        }
    }

    /**
     * Listens for the "Zoom Out x 2" button in <code>theView</code>
     *
     * @author Andre Amirsaleh
     */
    class ZoomOutListener implements ActionListener {

        /**
         * Zooms out on the image of the waveform
         * (<code>WaveFormComponent</code>)
         *
         * @param e <code>theView</code>'s <code>zoomOutButton</code>
         * (attribute) is clicked
         */
        @Override
        public void actionPerformed(ActionEvent e) {
            theView.getWaveImage().setNumIterations(
                    theView.getWaveImage().getShorts().size() * 2);
            theView.getWaveImage().setIterationFactor(
                    theView.getWaveImage().getIterationFactor() / 2);
            theView.getWavePanel().setViewportView(theView.getWaveImage());
        }
    }

    /**
     * Listens for the "Play" button in <code>theView</code>
     *
     * @author Andre Amirsaleh
     */
    class PlayListener implements ActionListener {

        /**
         * Plays the sound file
         *
         * @param e <code>theView</code>'s <code>playButton</code> (attribute)
         * is clicked
         * @author Andre Amirsaleh
         */
        @Override
        @SuppressWarnings("CallToPrintStackTrace")
        public void actionPerformed(ActionEvent e) {
            try {
                AudioUtility.playWaveForm(theModel);
            } catch (LineUnavailableException | IOException ex) {
                ex.printStackTrace();
            }
        }
    }

    /**
     * Listens for the "Exit" button in <code>theView</code>'s "File" drop-down
     * menu
     *
     * @author Andre Amirsaleh
     */
    class ExitListener implements ActionListener {

        /**
         * Exits the program
         *
         * @param e <code>theView</code>'s <code>exitButton</code> (attribute)
         * is clicked
         * @author Andre Amirsaleh
         */
        @Override
        public void actionPerformed(ActionEvent e) {
            theView.dispose();
            System.exit(0);
        }
    }

    /**
     * Listens for the "New" button in <code>theView</code>'s "File" drop-down
     * menu
     *
     * @author Andre Amirsaleh
     */
    class NewListener implements ActionListener {

        /**
         * Opens the "New Waveform" window in <code>theView</code>.
         *
         * @param e <code>theView</code>'s <code>menuItemNew</code> button (in
         * the "File" drop-down menu) is clicked
         * @author Andre Amirsaleh
         */
        @Override
        public void actionPerformed(ActionEvent e) {
            theView.getDialogBoxNew().setVisible(true);
        }
    }

    /**
     * Listens for the "OK" button in <code>theView</code>'s "New Waveform"
     * pop-up window
     *
     * @author Andre Amirsaleh
     */
    class OkNewListener implements ActionListener {

        /**
         * Sets <code>theModel</code> as the newly defined waveform and updates
         * <code>theView</code> accordingly. Handles the
         * <code>ActionEvent</code> generated by the user clicking the "OK"
         * button in the "New Waveform" pop-up window.
         *
         * @param e <code>theView</code>'s "OK" button in the "New Waveform"
         * dialog window is clicked
         * @author Andre Amirsaleh
         */
        @Override
        @SuppressWarnings("CallToPrintStackTrace")
        public void actionPerformed(ActionEvent e) {
            try {
                String sNewFreq = ((DialogBoxNew) theView.getDialogBoxNew()).getTextFieldFreq().getText();
                //System.out.println("You enetered: Frequency = " + sNewFreq);
                float newFreq = Float.parseFloat(sNewFreq);
                theView.setFreq(newFreq);

                String sNewSampleRate = ((DialogBoxNew) theView.getDialogBoxNew()).getTextFieldSampleRate().getText();
                float newSampleRate = Float.parseFloat(sNewSampleRate);
                theView.setSampleRate(newSampleRate);

                String sNewLength = ((DialogBoxNew) theView.getDialogBoxNew()).getTextFieldLength().getText();
                double newLength = Double.parseDouble(sNewLength);
                theView.setLengthInSec(newLength);

                theModel = new WaveForm(newFreq, newSampleRate,
                                        theModel.getSampleSize(), newLength);
                theView.setWaveImage(new WaveFormComponent(theModel));
                theView.getDialogBoxNew().dispose();
            } catch (WaveFormException ex) {
                ex.printStackTrace();
            }
        }
    }

    /**
     * Listens for the "Cancel" button in <code>theView</code>'s "New Waveform"
     * pop-up window
     *
     * @author Andre Amirsaleh
     */
    class CancelNewListener implements ActionListener {

        /**
         * Cancels the generation of a new waveform, and closes the "New
         * WaveForm" pop-up window.
         *
         * @param e <code>theView</code>'s "Cancel" button in the "New Waveform"
         * pop-up window is clicked
         * @author Andre Amirsaleh
         */
        @Override
        public void actionPerformed(ActionEvent e) {
            theView.getDialogBoxNew().dispose();
        }
    }

    /**
     * Listens for the "Open" button in <code>theView</code>'s "File" drop-down
     * menu.
     *
     * @author Andre Amirsaleh
     * @see https://netbeans.org/kb/docs/java/gui-filechooser.html
     */
    class OpenListener implements ActionListener {

        /**
         * Opens a <code>JFileChooser</code> when the "Open" button is clicked
         * and updates <code>theModel</code> and <code>theView</code>
         * accordingly
         *
         * @param e <code>theView</code>'s "Open" button (in the "File"
         * drop-down menu) is clicked
         * @author Andre Amirsaleh
         */
        @Override
        @SuppressWarnings("CallToPrintStackTrace")
        public void actionPerformed(ActionEvent e) {
            int returnVal = theView.getFileChooser().showOpenDialog(theView);
            if (returnVal == JFileChooser.APPROVE_OPTION) {
                File file = theView.getFileChooser().getSelectedFile();
                try {
                    theModel = new WaveForm(file);
                } catch (UnsupportedAudioFileException | IOException | WaveFormException ex) {
                    ex.printStackTrace();
                }
                theView.setWaveImage(new WaveFormComponent(theModel));
            } else {
                System.out.println("File access cancelled by user.");
            }
        }
    }

    /* *************************************************************************
     * GETTERS AND SETTERS
     **************************************************************************/
    /**
     * Returns <code>theView</code> attribute
     *
     * @return GUI object which reflects the data contained in
     * <code>theModel</code>
     * @author Andre Amirsaleh
     */
    public MainView getTheView() {
        return theView;
    }

    /**
     * Returns <code>theModel</code> attribute
     *
     * @return Object containing data displayed on GUI
     * @author Andre Amirsaleh
     */
    public WaveForm getTheModel() {
        return theModel;
    }

    /**
     * Sets <code>theView</code> attribute
     *
     * @param theView GUI object which reflects the data contained in
     * <code>theModel</code>
     * @author Andre Amirsaleh
     */
    public void setTheView(MainView theView) {
        this.theView = theView;
    }

    /**
     * Sets <code>theModel</code> attribute
     *
     * @param theModel Object containing data displayed on GUI
     * @author Andre Amirsaleh
     */
    public void setTheModel(WaveForm theModel) {
        this.theModel = theModel;
    }
}
