/* *****************************************
 * CSCI205 - Software Engineering and Design
 * Spring 2016
 *
 * Name: Andre Amirsaleh
 * Date: Mar 21, 2016
 * Time: 1:49:38 PM
 *
 * Project: csci205
 * Package: lab13
 * File: TrafficLightComponent
 * Description: TrafficLightComponent class extends JComponent to create a
 * traffic light image
 * ****************************************
 */
package lab13;

import java.awt.Color;
import java.awt.Dimension;
import java.awt.Graphics;
import java.awt.Graphics2D;
import java.awt.Rectangle;
import javax.swing.JComponent;

/**
 * A drawing of a traffic light
 *
 * @author Andre Amirsaleh
 */
public class TrafficLightComponent extends JComponent {

    /**
     * The width of the image
     */
    public static final int WIDTH = 200;

    /**
     * The height of the image
     */
    public static final int HEIGHT = 600;

    /**
     * Constructs a <code>TrafficLightComponent</code> instance. Same as parent
     * constructor.
     */
    public TrafficLightComponent() {
        super();
    }

    /**
     * Paints a traffic light
     *
     * @param g Graphics object
     */
    @Override
    protected void paintComponent(Graphics g) {
        Graphics2D myPainting = (Graphics2D) g;
        Rectangle pane = g.getClipBounds();
        int ovalWidth = pane.width;
        int ovalHeight = pane.height / 3;
        // Fill background:
        myPainting.fill(pane);
        // Draw red light:
        myPainting.setColor(Color.red);
        myPainting.fillOval(pane.x, pane.y, ovalWidth, ovalHeight);
        // Draw yellow light:
        myPainting.setColor(Color.YELLOW);
        myPainting.fillOval(pane.x, pane.y + ovalHeight, ovalWidth, ovalHeight);
        // Draw green light:
        myPainting.setColor(Color.GREEN);
        myPainting.fillOval(pane.x, pane.y + 2 * ovalHeight, ovalWidth,
                            ovalHeight);
    }

    /**
     * Returns a symmetrical <code>Dimension</code> for the traffic light
     * painting
     *
     * @return Symmetric values around which the traffic light painting was
     * originally designed
     */
    @Override
    public Dimension getPreferredSize() {
        Dimension prefSize = new Dimension();
        prefSize.setSize(WIDTH, HEIGHT);
        return prefSize;
    }
}
