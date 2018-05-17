/* *****************************************
 * CSCI205 - Software Engineering and Design
 * Spring 2016
 *
 * Name: Andre Amirsaleh, Brooke Bullek, Daniel Vasquez, Xizhou Li
 * Date: Apr 9, 2016
 * Time: 5:26:33 PM
 *
 * Project: csci205FinalProject
 * Package: tetris.model
 * File: ScoreBoard
 * Description: The IDs for the different State classes
 *
 * ****************************************
 */
package tetris.view.GameStates;

/**
 * A collection of states that represent allowable game screens/modes.
 *
 * @author Xizhou Li & Brooke Bullek
 */
public enum State {
    GAME(0), MENU(1), GAME_OVER(2), HIGH_SCORES(3);

    /**
     * Each state has an ID which identifies the active state to render/update
     * in Slick.
     */
    private final int ID;

    /**
     * Constructor for the State enum.
     *
     * @author Brooke Bullek
     * @param ID The ID associated with this state
     */
    State(int ID) {
        this.ID = ID;
    }

    public int getID() {
        return this.ID;
    }
}
