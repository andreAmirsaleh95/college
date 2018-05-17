/* *****************************************
 * CSCI205 - Software Engineering and Design
 * Spring 2016 *
 * Name: Andre Amirsaleh and Nazmul Hossain
 * Date: Apr 3, 2016
 * Time: 4:20:15 PM *
 * Project: csci205_hw03
 * Package: hw3.controller
 * File: WaveFormComponent
 * Description: Renders the WaveForm using the Graphics2D API
 * ****************************************
 */
package hw3.view;

import hw3.model.WaveForm;
import hw3.utility.WaveFormComponentUtility;
import java.awt.Color;
import java.awt.Graphics;
import java.awt.Graphics2D;
import java.awt.geom.GeneralPath;
import java.util.ArrayList;
import javax.swing.JComponent;

/**
 * Graphical drawing of a <code>WaveForm</code> (<code>theModel</code>)
 *
 * @author Nazmul Hossain and Andre Amirsaleh
 */
public class WaveFormComponent extends JComponent {

    /**
     * Maximum number of data points
     *
     * @author Andre Amirsaleh
     */
    public static final int MAX_LEN = 100000;

    /**
     * The <code>WaveForm</code> as data points
     *
     * @author Andre Amirsaleh
     */
    private ArrayList<Short> shorts;

    /**
     * True if the image of <code>this</code> is zoomed in; false otherwise.
     *
     * @author Andre Amirsaleh
     */
    private boolean isZoomedIn;

    /**
     * Affects the number of samples to draw in <code>paintComponent</code>
     * method. Affects resolution of the image. Initialized to 10, this value
     * changes when a user zooms in or out.
     *
     * @author Andre Amirsaleh
     */
    private float iterationFactor;

    /**
     * Number of data points to draw in the <code>paintComponent</code> method
     *
     * @author Andre Amirsaleh
     */
    private int numIterations;

    /**
     * Constructs a <code>WaveFormComponent</code> instance
     *
     * @param theModel The <code>WaveForm</code> to draw
     * @author Andre Amirsaleh
     */
    public WaveFormComponent(WaveForm theModel) {
        super();
        shorts = new ArrayList<>();
        isZoomedIn = false;
        this.iterationFactor = 10;
        byte[] bytes = theModel.getByteArray();
        for (int i = 0; i < MAX_LEN; i++) {
            try {
                shorts.add(theModel.getShortBufferWrapper().get(i));
            } catch (IndexOutOfBoundsException ex) {
                break;
            }
        }
        this.numIterations = shorts.size();
    }

    /**
     * Paints the waveform
     *
     * @param g Graphic passed in by look and feel
     * @author Andre Amirsaleh
     * @see https://docs.oracle.com/javase/tutorial/2d/geometry/arbitrary.html
     */
    @Override
    public void paintComponent(Graphics g) {
        super.paintComponent(g);
        Graphics2D thePainting = (Graphics2D) g;
        thePainting.setColor(Color.BLUE);
        GeneralPath polyline = new GeneralPath(GeneralPath.WIND_EVEN_ODD,
                                               shorts.size());
        polyline.moveTo(0, shorts.get(0) * this.getHeight() / 2);
        short max = WaveFormComponentUtility.absMaxShort(shorts);
        System.out.println("shorts.size() = " + shorts.size());

        for (int x = 0; x < shorts.size(); x += 1 * this.iterationFactor) {
            double xRelativeToWidth = (double) (x * this.getWidth()) / shorts.size();
            double yRelativeToHeight = -shorts.get(x) * this.getHeight() / 2 / max + this.getHeight() / 2;

            // Map line to next data point:
            polyline.lineTo(xRelativeToWidth, yRelativeToHeight);
        }

        // Now, that the line is mapped out, draw it!
        thePainting.draw(polyline);
    }

    /**
     * Returns <code>iterationFactor</code> attribute
     *
     * @return This value is used to change the resolution of
     * <code>this Component</code>'s image
     * @author Andre Amirsaleh
     */
    public float getIterationFactor() {
        return this.iterationFactor;
    }

    /**
     * Returns the <code>MAX_LEN</code> attribute
     *
     * @return Number of samples to take from the current <code>WaveForm</code>
     * @author Andre Amirsaleh
     */
    public static int getMAX_LEN() {
        return MAX_LEN;
    }

    /**
     * Returns <code>shorts</code> attribute
     *
     * @return Samples of the current <code>WaveComponent</code>
     * @author Andre Amirsaleh
     */
    public ArrayList<Short> getShorts() {
        return shorts;
    }

    /**
     * Returns <code>isZoomedIn</code> attribute
     *
     * @return True if the drawing of <code>this Component</code> is zoomed in,
     * false otherwise
     * @author Andre Amirsaleh
     */
    public boolean isIsZoomedIn() {
        return isZoomedIn;
    }

    /**
     * Returns <code>numIterations</code> attribute
     *
     * @return Number of samples to draw
     * @author Andre Amirsaleh
     */
    public int getNumIterations() {
        return numIterations;
    }

    /**
     * Sets <code>isZoomedIn</code> attribute
     *
     * @param isZoomedIn New <code>isZoomedIn</code> value
     * @author Andre Amirsaleh
     */
    public void setIsZoomedIn(boolean isZoomedIn) {
        this.isZoomedIn = isZoomedIn;
    }

    /**
     * Sets <code>numIterations</code> value
     *
     * @param numIterations New value for <code>numIterations</code> attribute
     * @author Andre Amirsaleh
     */
    public void setNumIterations(int numIterations) {
        this.numIterations = numIterations;
    }

    /**
     * Sets the <code>iterationFactor</code> attribute
     *
     * @param newIterationFactor New <code>iterationFactor</code> value
     * @author Andre Amirsaleh
     */
    public void setIterationFactor(float newIterationFactor) {
        this.iterationFactor = newIterationFactor;
    }
}
