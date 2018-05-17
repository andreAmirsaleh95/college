/* *****************************************
 * CSCI205 - Software Engineering and Design
 * Spring 2016
 *
 * Name: Andre Amirsaleh, Brooke Bullek, Daniel Vasquez, Xizhou Li
 * Date: Apr 29, 2016
 * Time: 1:45:59 PM
 *
 * Project: csci205FinalProject
 * Package: tetris.view.GameStates
 * File: HighScoresState
 * Description: The "High Scores" screen
 *
 * ****************************************
 */
package tetris.view.GameStates;

import java.util.ArrayList;
import java.util.List;
import org.newdawn.slick.Image;
import org.newdawn.slick.TrueTypeFont;
import tetris.controller.MainController;
import tetris.resources.Resources;
import tetris.utility.HighScoresUtility;

/**
 * The state of Tetris while the high scores screen is active.
 *
 * @author Andre Amirsaleh
 */
public class HighScoresState extends BasicTetrisState {

    /**
     * The ID associated with the HighScoresState.
     */
    private static final int ID = State.HIGH_SCORES.getID();

    /**
     * The font used to draw the scoreboard ranks.
     */
    public static final TrueTypeFont RANKS_FONT = Resources.FONTS.get(
            "oldHighScore");

    /**
     * The font used to draw the scoreboard values.
     */
    public static final TrueTypeFont VALUES_FONT = Resources.FONTS.get(
            "scoreRetro");

    /**
     * An array of the high scores as <code>int</code>s.
     */
    private int[] iHighScores;

    /**
     * An array of the high scores as Strings.
     */
    private List<String> sHighScores;

    /**
     * The background drawn underneath the high score listing.
     */
    private static Image background;

    /**
     * Constructs a new <code>HighScoresState</code> instance
     *
     * @param controller an instance of the primary controller class
     * @author Andre Amirsaleh
     */
    public HighScoresState(MainController controller) {
        super(controller);
        iHighScores = HighScoresUtility.getHighScores();
        sHighScores = new ArrayList<>();
        background = Resources.IMAGES.get("backgroundScores");
        String sScore;
        for (int iScore : iHighScores) {
            sScore = String.valueOf(iScore);
            sHighScores.add(sScore);
        }
    }

    // *************************************************************************
    // GETTERS/SETTERS:
    // *************************************************************************
    /**
     * Returns the <code>HighScoresState</code> ID
     *
     * @return Integer representing the <code>HighScoresState</code>
     * @author Andre Amirsaleh
     */
    @Override
    public int getID() {
        return ID;
    }

    /**
     * Returns the <code>iHighScores</code> attribute
     *
     * @return An array of the high scores as <code>int</code>s
     */
    public int[] getIHighScores() {
        return iHighScores;
    }

    /**
     * Returns the <code>sHighScores</code> attribute
     *
     * @return An array of the high scores as <code>String</code>s.
     */
    public List<String> getSHighScores() {
        return sHighScores;
    }

    /**
     * Sets the <code>iHighScores</code> and <code>sHighScores</code> attributes
     *
     * @param newHighScores The new high scores to set the
     * <code>iHighScores</code> and <code>sHighScores</code> attributes as
     */
    public void setHighScores(int[] newHighScores) {
        this.iHighScores = newHighScores;
        String sHighScore;
        for (int i = 0; i < this.iHighScores.length; i++) {
            sHighScore = String.valueOf(this.iHighScores[i]);
            this.sHighScores.set(i, sHighScore);
        }
    }

    /**
     * Returns the <code>background</code> attribute
     *
     * @return The background drawn underneath the high score listing
     */
    public Image getBackground() {
        return background;
    }

    /**
     * Sets the <code>background</code> attribute
     *
     * @param background The background drawn underneath the high score listing
     */
    public void setBackground(Image background) {
        HighScoresState.background = background;
    }
}
