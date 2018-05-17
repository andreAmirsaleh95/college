/* *****************************************
 * CSCI205 - Software Engineering and Design
 * Spring 2016
 *
 * Name: Andre Amirsaleh, Brooke Bullek, Daniel Vasquez, Xizhou Li
 * Date: May 2, 2016
 * Time: 5:49:28 PM
 *
 * Project: csci205FinalProject
 * Package: tetris.view.GameStates
 * File: BasicTetrisState
 * Description:
 *
 * ****************************************
 */
package tetris.view.GameStates;

import org.newdawn.slick.GameContainer;
import org.newdawn.slick.Graphics;
import org.newdawn.slick.SlickException;
import org.newdawn.slick.state.BasicGameState;
import org.newdawn.slick.state.StateBasedGame;
import tetris.controller.MainController;

/**
 * Basic State class. Parent class for all GameStates in Tetris
 *
 * @author Andre Amirsaleh
 */
public abstract class BasicTetrisState extends BasicGameState {

    /**
     * An instance of the primary controller class used to render and update
     * entities.
     */
    private final MainController controller;

    /**
     * Constructs a new BasicTetrisState instance
     *
     * @param controller The <code>controller</code> attribute
     */
    public BasicTetrisState(MainController controller) {
        this.controller = controller;
    }

    /**
     * Returns the ID of the specific BasicTetrisState.
     *
     * @return The ID associated with the specific BasicTetrisState
     */
    @Override
    public abstract int getID();

    /**
     * Initialize this BasicTetrisState. Does NOTHING, but children may override
     * this method because Slick will call this method when initializing the
     * specific BasicTetrisStates
     *
     * @param gc A generic game container that handles the game loop
     * @param sbg A State based game isolated into different stages
     * @throws SlickException
     */
    @Override
    public void init(GameContainer gc, StateBasedGame sbg) throws SlickException {
        // Do nothing!
    }

    /**
     * Renders on-screen elements while in the specified state. Passes
     * responsibility to controller. Controller distinguishes which state Tetris
     * is in by using the State class (enum).
     *
     * @param gc A generic game container that handles the game loop
     * @param sbg A State based game isolated into different stages
     * @param grphcs A graphics context used to render primitives to the canvas
     * @throws SlickException
     */
    @Override
    public void render(GameContainer gc, StateBasedGame sbg, Graphics grphcs) throws SlickException {
        controller.render(gc, sbg, grphcs);
    }

    /**
     * Updates this BasicTetrisState. This method merely calls the
     * <code>controller</code>'s update method.
     *
     * @param gc A generic game container that handles the game loo
     * @param sbg A State based game isolated into different stages
     * @param i Factor by which to alter the game's clock/timer
     * @throws SlickException
     */
    @Override
    public void update(GameContainer gc, StateBasedGame sbg, int i) throws SlickException {
        controller.update(gc, sbg, i);
    }
}
