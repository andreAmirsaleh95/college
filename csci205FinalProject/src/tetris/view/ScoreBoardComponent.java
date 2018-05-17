/* *****************************************
 * CSCI205 - Software Engineering and Design
 * Spring 2016
 *
 * Name: Andre Amirsaleh, Brooke Bullek, Daniel Vasquez, Xizhou Li
 * Date: Apr 29, 2016
 * Time: 4:25:27 AM
 *
 * Project: csci205FinalProject
 * Package: tetris.view
 * File: ScoreBoardComponent
 * Description: The Component class for ScoreBoard
 *
 * ****************************************
 */
package tetris.view;

import static org.newdawn.slick.Color.white;
import org.newdawn.slick.GameContainer;
import org.newdawn.slick.Graphics;
import org.newdawn.slick.TrueTypeFont;
import tetris.model.ScoreBoard;

/**
 * Possesses the capability to render a ScoreBoard on the screen.
 *
 * @author Brooke Bullek
 */
public class ScoreBoardComponent {

    /**
     * The ScoreBoard to be rendered by this component.
     */
    private ScoreBoard scoreBoard;

    /**
     * The font used to draw the user's active high score.
     */
    private TrueTypeFont font;

    /**
     * The constructor for the ScoreBoardComponent class.
     */
    public ScoreBoardComponent() {
        scoreBoard = null;
        font = null;
    }

    /* Getters and setters */
    public ScoreBoard getScoreBoard() {
        return scoreBoard;
    }

    public void setScoreBoard(ScoreBoard scoreBoard) {
        this.scoreBoard = scoreBoard;
    }

    public TrueTypeFont getFont() {
        return font;
    }

    public void setFont(TrueTypeFont font) {
        this.font = font;
    }
    /* End of getters and setters */

    /**
     * Renders the ScoreBoard.
     *
     * @author Andre Amirsaleh
     * @param gc A generic game container that handles the game loop
     * @param g A graphics context used to render primitives to the canvas
     */
    public void render(GameContainer gc, Graphics g) {
        String points = String.valueOf(scoreBoard.getPoints());
        g.setColor(white);
        g.setFont(font);
        g.drawString(points, PixelDimension.BLOCK_WIDTH.getPixels() * 13, 27);
    }
}
