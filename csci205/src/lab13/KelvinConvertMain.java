/* *****************************************
 * CSCI205 - Software Engineering and Design
 * Spring 2016
 *
 * Name: Andre Amirsaleh
 * Date: Mar 25, 2016
 * Time: 10:51:48 PM
 *
 * Project: csci205
 * Package: lab13
 * File: KelvinConvertMain
 * Description: lab13b
 *
 * ****************************************
 */
package lab13;

import javax.swing.UIManager;

/**
 * MVC-based design for the Kelvin conversion GUI
 *
 * @author Andre Amirsaleh
 */
public class KelvinConvertMain {

    /**
     * Launches GUI
     *
     * @param args the command line arguments
     */
    @SuppressWarnings({"CallToPrintStackTrace", "Convert2Lambda"})
    public static void main(String[] args) {
        try {
            /*for (javax.swing.UIManager.LookAndFeelInfo info : javax.swing.UIManager.getInstalledLookAndFeels()) {
             if ("Nimbus".equals(info.getName())) {
             javax.swing.UIManager.setLookAndFeel(info.getClassName());
             break;
             }
             }*/
            UIManager.setLookAndFeel(UIManager.getSystemLookAndFeelClassName());
        } catch (ClassNotFoundException | InstantiationException |
                 IllegalAccessException |
                 javax.swing.UnsupportedLookAndFeelException ex) {
            ex.printStackTrace();
        }
        //</editor-fold>

        //</editor-fold>

        /* Create and display the form */
        java.awt.EventQueue.invokeLater(new Runnable() {
            @Override
            public void run() {
                KelvinConvertModel theModel = new KelvinConvertModel();
                MainView theView = new MainView();
                KelvinConvertController theController = new KelvinConvertController(
                        theModel, theView);

                theView.setVisible(true);
            }
        });
    }
}
