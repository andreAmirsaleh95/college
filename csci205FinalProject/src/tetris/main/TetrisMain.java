/* *****************************************
 * CSCI205 - Software Engineering and Design
 * Spring 2016
 *
 * Name: Andre Amirsaleh, Brooke Bullek, Daniel Vasquez, Xizhou Li
 * Date: Apr, 2016
 * Time:
 *
 * Project: csci205FinalProject
 * Package: tetris.controller
 * File: MainController
 * Description: Contains main method to launch the program
 *
 * ****************************************
 */
package tetris.main;

import java.io.File;
import org.newdawn.slick.AppGameContainer;
import org.newdawn.slick.SlickException;
import tetris.controller.MainController;
import tetris.model.MainModel;
import tetris.view.MainView;
import tetris.view.PixelDimension;

/**
 * Contains the necessary methods to launch and run the Tetris application
 *
 * @author Xizhou Li
 */
public class TetrisMain {

    /**
     * Slick convention: false while game is running.
     */
    public static boolean _APPLET = true;

    /**
     * Main method to run the Tetris application
     *
     * @param args Command line arguments
     * @author Xizhou Li
     */
    public static void main(String[] args) {
        _APPLET = false;
        File file = new File("natives");
        if (file.exists()) {
            System.setProperty("org.lwjgl.librarypath", file.getAbsolutePath());
        }
        try {

            // instantiate the model, view & controller
            MainModel theModel = new MainModel();
            MainView theView = new MainView("Tetris", null);
            MainController theController = new MainController(theModel, theView);
            theView.setMainController(theController);

            AppGameContainer game = new AppGameContainer(theView);
            game.setDisplayMode(PixelDimension.WINDOW_WIDTH.getPixels(),
                                PixelDimension.WINDOW_HEIGHT.getPixels(), false);
            game.start();
        } catch (SlickException ex) {
            ex.printStackTrace();
        }
    }
}
