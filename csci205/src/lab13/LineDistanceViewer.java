/* *****************************************
 * CSCI205 - Software Engineering and Design
 * Spring 2016
 *
 * Name: Andre Amirsaleh
 * Date: Mar 22, 2016
 * Time: 5:08:10 PM
 *
 * Project: csci205
 * Package: lab13
 * File: LineDistanceViewer
 * Description: Lab13a - Exercise 2
 * *****************************************/
package lab13;

import java.awt.EventQueue;
import javax.swing.JFrame;

/**
 * Displays a few fixed points and their distances from a line segment
 *
 * @author Andre Amirsaleh
 */
public class LineDistanceViewer extends JFrame {

    /**
     * Window title - displayed at the top
     */
    public static final String WINDOW_TITLE = "Line Distance Viewer";

    /**
     * Width of the window when it initially pops up
     */
    public static final int WINDOW_WIDTH = 600;

    /**
     * Height of the window when it initially pops up
     */
    public static final int WINDOW_HEIGHT = 400;

    public LineDistanceViewer() {
        this.setSize(WINDOW_WIDTH, WINDOW_HEIGHT);
        this.setTitle(WINDOW_TITLE);
        this.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        this.setLocationRelativeTo(null);
        this.getContentPane().add(new LineDistanceComponent());
    }

    /**
     * main method
     *
     * @param args the command line arguments
     */
    @SuppressWarnings("Convert2Lambda")
    public static void main(String[] args) {
        EventQueue.invokeLater(new Runnable() { // Anonymous Inner Class (AIC)

            @Override
            @SuppressWarnings("CallToPrintStackTrace")
            public void run() {
                try {
                    LineDistanceViewer frame = new LineDistanceViewer();
                    frame.setVisible(true);
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        });
    }
}
