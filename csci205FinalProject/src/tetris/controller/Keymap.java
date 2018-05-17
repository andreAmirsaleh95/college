/* *****************************************
 * CSCI205 - Software Engineering and Design
 * Spring 2016
 *
 * Name: Andre Amirsaleh, Brooke Bullek, Daniel Vasquez, Xizhou Li
 * Date: Apr 29, 2016
 * Time: 2:07:07 AM
 *
 * Project: csci205FinalProject
 * Package: tetris.controller
 * File: Keymap
 * Description: A collection of controls mapped to their respective keyboard
 * bindings.
 *
 * ****************************************
 */
package tetris.controller;

import org.newdawn.slick.Input;

/**
 * A collection of controls mapped to their respective keyboard bindings.
 *
 * @author Brooke Bullek
 */
public enum Keymap {
    PAUSE(Input.KEY_ESCAPE),
    HOLD_TETRIMINO(Input.KEY_LCONTROL),
    HARD_DROP(Input.KEY_SPACE),
    SOFT_DROP(Input.KEY_DOWN),
    MOVE_RIGHT(Input.KEY_RIGHT),
    MOVE_LEFT(Input.KEY_LEFT),
    ROTATE_TETRIMINO(Input.KEY_UP),
    START_NEW_GAME(Input.KEY_ESCAPE);

    /**
     * An integer that maps to a constant from the Input class. Designates which
     * key activates this command.
     */
    private final int key;

    /**
     * Constructor for the Keymap enum.
     *
     * @author Brooke Bullek
     * @param key The keymapping for this command
     */
    Keymap(int key) {
        this.key = key;
    }

    public int getKey() {
        return key;
    }
}
