/* *****************************************
 * CSCI205 - Software Engineering and Design
 * Spring 2016
 *
 * Name: Andre Amirsaleh
 * Date: Mar 21, 2016
 * Time: 1:50:56 PM
 *
 * Project: csci205
 * Package: lab13
 * File: TrafficLightViewer
 * Description: TrafficLightViewer class contains main method that opens a
 * traffic light in JFrame using the TrafficLightComponent class
 * ****************************************
 */
package lab13;

import java.awt.EventQueue;
import java.awt.HeadlessException;
import javax.swing.JFrame;

/**
 * Client for viewing a traffic light via TrafficLightComponent class
 *
 * @author Andre Amirsaleh
 */
public class TrafficLightViewer extends JFrame {

    public TrafficLightViewer() throws HeadlessException {
        // Customize frame:
        this.setTitle("Traffic Light");
        this.setSize(TrafficLightComponent.WIDTH,
                     TrafficLightComponent.HEIGHT);
        this.setLocationRelativeTo(null);
        this.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);

        // Add the TrafficLightComponent to the content pane:
        TrafficLightComponent trafficLight = new TrafficLightComponent();
        this.getContentPane().add(trafficLight);
    }

    /**
     * Main method to generate a traffic light in JFrame
     *
     * @param args the command line arguments
     */
    @SuppressWarnings("Convert2Lambda")
    public static void main(String[] args) {
        EventQueue.invokeLater(new Runnable() {

            @Override
            @SuppressWarnings("CallToPrintStackTrace")
            public void run() {
                try {
                    TrafficLightViewer frame = new TrafficLightViewer();
                    frame.setVisible(true);
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        });
    }
}
