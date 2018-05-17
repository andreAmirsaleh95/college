/* *****************************************
 * CSCI205 - Software Engineering and Design
 * Spring 2016
 *
 * Name: Andre Amirsaleh, Brooke Bullek, Daniel Vasquez, Xizhou Li
 * Date: Apr 21, 2016
 * Time: 1:45:59 PM
 *
 * Project: csci205FinalProject
 * Package: tetris.view.GameStates
 * File: HighScoresState
 * Description: The "menu" screen
 *
 * ****************************************
 */
package tetris.view.GameStates;

import org.newdawn.slick.Image;
import tetris.controller.MainController;
import tetris.resources.Resources;

/**
 * The state of Tetris while the main menu is active.
 *
 * @author Xizhou Li & Brooke Bullek
 */
public class MenuState extends BasicTetrisState {

    /**
     * The image for the Play button in the menu screen.
     */
    public static final Image PLAY_BUTTON = Resources.IMAGES.get("play");

    /**
     * The title logo for the menu screen.
     */
    public static final Image TETRIS_LOGO = Resources.IMAGES.get("menu");

    /**
     * The ID associated with the MenuState.
     */
    private static final int ID = State.MENU.getID();

    /**
     * Background image for the menu screen.
     */
    private static Image background;

    /**
     * Constructs a new MenuState instance
     *
     * @param controller An instance of the primary controller class
     */
    public MenuState(MainController controller) {
        super(controller);
        background = Resources.IMAGES.get("menuNoHighlight");
    }

    /* Getters and setters */
    @Override
    public int getID() {
        return ID;
    }

    public Image getBackground() {
        return background;
    }

    public void setBackground(Image background) {
        MenuState.background = background;
    }
    /* End of getters and setters */
}
