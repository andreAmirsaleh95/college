/* *****************************************
 * CSCI205 - Software Engineering and Design
 * Spring 2016
 *
 * Name: Andre Amirsaleh
 * Date: Mar 22, 2016
 * Time: 5:16:41 PM
 *
 * Project: csci205
 * Package: lab13
 * File: LineDistanceComponent
 * Description: lab13a - Exercise 2
 * ****************************************/
package lab13;

import java.awt.Graphics;
import java.awt.Graphics2D;
import java.awt.geom.Line2D;
import java.awt.geom.Point2D;
import javax.swing.JComponent;

/**
 *
 * @author Andre Amirsaleh
 */
public class LineDistanceComponent extends JComponent {
    /**
     * Point (100, 100)
     */
    public static final Point2D.Double P1 = new Point2D.Double(100, 100);

    /**
     * Point (200, 200)
     */
    public static final Point2D.Double P2 = new Point2D.Double(200, 200);

    /**
     * Point (100, 200)
     */
    public static final Point2D.Double P3 = new Point2D.Double(100, 200);

    /**
     * Point (150, 150)
     */
    public static final Point2D.Double P4 = new Point2D.Double(150, 150);

    /**
     * Point (250, 50)
     */
    public static final Point2D.Double P5 = new Point2D.Double(250, 50);

    /**
     * Line segment with endpoints P1 and P2
     */
    public static final Line2D.Double LINE = new Line2D.Double(P1, P2);

    /**
     * Size of the points in the drawing
     */
    public static final int POINT_SIZE = 4;

    /**
     * Constructs a <code>LineDistanceComponent</code> instance
     */
    public LineDistanceComponent() {
        super();
    }

    /**
     * Draws the image of the dots and the line segment
     *
     * @param g The content pane of the JFrame
     */
    @Override
    protected void paintComponent(Graphics g) {
        double distance;

        // preserve g:
        Graphics2D g2 = (Graphics2D) g;
        // Draw P1:
        g2.fillOval((int) (P1.getX() - POINT_SIZE / 2),
                    (int) (P1.getY() - POINT_SIZE / 2), POINT_SIZE, POINT_SIZE);
        // Draw P2:
        g2.fillOval((int) (P2.getX() - POINT_SIZE / 2),
                    (int) (P2.getY() - POINT_SIZE / 2), POINT_SIZE, POINT_SIZE);
        // Draw LINE:
        g2.draw(LINE);
        // Draw P3 and its distance from LINE:
        g2.fillOval((int) (P3.getX() - POINT_SIZE / 2),
                    (int) (P3.getY() - POINT_SIZE / 2), POINT_SIZE, POINT_SIZE);
        distance = LINE.ptLineDist(P3);
        g2.drawString("Distance: " + distance, (int) P3.getX(), (int) P3.getY());
        // Draw P4 and its distance from LINE:
        g2.fillOval((int) (P4.getX() - POINT_SIZE / 2),
                    (int) (P4.getY() - POINT_SIZE / 2), POINT_SIZE, POINT_SIZE);
        distance = LINE.ptLineDist(P3);
        g2.drawString("Distance: " + distance, (int) P4.getX(), (int) P4.getY());
        // Draw P5 and its distance from LINE:
        g2.fillOval((int) (P5.getX() - POINT_SIZE / 2),
                    (int) (P5.getY() - POINT_SIZE / 2), POINT_SIZE, POINT_SIZE);
        distance = LINE.ptLineDist(P3);
        g2.drawString("Distance: " + distance, (int) P5.getX(), (int) P5.getY());
    }
}
