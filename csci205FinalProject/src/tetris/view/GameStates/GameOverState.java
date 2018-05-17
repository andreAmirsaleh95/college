/* *****************************************
 * CSCI205 - Software Engineering and Design
 * Spring 2016
 *
 * Name: Andre Amirsaleh, Brooke Bullek, Daniel Vasquez, Xizhou Li
 * Date: Apr 29, 2016
 * Time: 12:17:39 AM
 *
 * Project: csci205FinalProject
 * Package: tetris.view.GameStates
 * File: GameOverState
 * Description: Tetris enters this state when a player loses a game
 *
 * ****************************************
 */
package tetris.view.GameStates;

import org.newdawn.slick.Animation;
import tetris.controller.MainController;
import tetris.resources.Resources;

/**
 * The State entered when the player loses the game and is greeted by a Game
 * Over screen.
 *
 * @author Brooke Bullek
 */
public class GameOverState extends BasicTetrisState {

    /**
     * The ID associated with the GameOverState.
     */
    private static final int ID = State.GAME_OVER.getID();

    /**
     * The "game over" animation, which is displayed when the user loses.
     */
    public static final Animation GAME_OVER_ANIMATION = Resources.ANIMATIONS.get(
            "gameOverAnimation");

    /**
     * Constructs a new GameOverState instance
     *
     * @param controller An instance of the primary controller class used to
     * render and update entities.
     */
    public GameOverState(MainController controller) {
        super(controller);
    }

    /* Getters and setters */
    /**
     * Returns the <code>ID</code> attribute
     *
     * @return
     */
    @Override
    public int getID() {
        return ID;
    }
    /* End of getters and setters */
}
