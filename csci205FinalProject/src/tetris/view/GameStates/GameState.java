/* *****************************************
 * CSCI205 - Software Engineering and Design
 * Spring 2016
 *
 * Name: Andre Amirsaleh, Brooke Bullek, Daniel Vasquez, Xizhou Li
 * Date: Apr 20, 2016
 * Time: 1:45:59 PM
 *
 * Project: csci205FinalProject
 * Package: tetris.view.GameStates
 * File: HighScoresState
 * Description: The "in-game" screen
 *
 * ****************************************
 */
package tetris.view.GameStates;

import org.newdawn.slick.GameContainer;
import org.newdawn.slick.Image;
import org.newdawn.slick.Music;
import org.newdawn.slick.SlickException;
import org.newdawn.slick.state.StateBasedGame;
import tetris.controller.MainController;
import tetris.resources.Resources;

/**
 * The state of Tetris while the game is active.
 *
 * @author Xizhou Li & Brooke Bullek
 */
public class GameState extends BasicTetrisState {

    /**
     * The ID associated with the GameState.
     */
    private static final int ID = State.GAME.getID();

    /**
     * Background music that plays (regardless of the state/screen the player is
     * in).
     */
    public static final Music MUSIC = Resources.MUSICS.get(
            "backgroundMusicRemix");

    /**
     * Background image to display on the GameBoard (The left half of the
     * GameState screen).
     */
    public static final Image BACKGROUND = Resources.IMAGES.get("background");

    /**
     * The background image to render on the right half of the GameState screen.
     */
    public static final Image SIDE_PANEL = Resources.IMAGES.get("gameComponent");

    /**
     * Constructs a new GameState instance
     *
     * @param controller An instance of the primary controller class used to
     * render and update entities.
     */
    public GameState(MainController controller) {
        super(controller);
    }

    /**
     * Initializes a new GameState.
     *
     * @param gc A generic game container that handles the game loop
     * @param s A State based game isolated into different stages
     * @throws SlickException
     */
    @Override
    public void init(GameContainer gc, StateBasedGame s) throws SlickException {
        MUSIC.loop();
    }

    /* Getters and setters */
    /**
     * Returns the <code>ID</code> attribute
     *
     * @return The ID associated with the GameState
     */
    @Override
    public int getID() {
        return ID;
    }
    /* End of getters and setters */
}
