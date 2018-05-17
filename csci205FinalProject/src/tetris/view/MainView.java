/* *****************************************
 * CSCI205 - Software Engineering and Design
 * Spring 2016
 *
 * Name: Andre Amirsaleh, Brooke Bullek, Daniel Vasquez, Xizhou Li
 * Date: Apr 10, 2016
 * Time: 11:31:24 PM
 *
 * Project: csci205FinalProject
 * Package: tetris.view
 * File: MainView
 * Description: Contains the necessary methods to launch and run the Tetris
 * application
 * ****************************************
 */
package tetris.view;

import java.util.List;
import org.newdawn.slick.Color;
import org.newdawn.slick.GameContainer;
import org.newdawn.slick.Graphics;
import org.newdawn.slick.SlickException;
import org.newdawn.slick.state.StateBasedGame;
import tetris.controller.MainController;
import tetris.model.GameBoard;
import tetris.resources.Resources;
import tetris.view.GameStates.GameOverState;
import tetris.view.GameStates.GameState;
import tetris.view.GameStates.HighScoresState;
import tetris.view.GameStates.MenuState;

/**
 * Contains the visual components that must be rendered and everything that's
 * associated with the Tetris GUI.
 *
 * @author Xizhou Li
 */
public class MainView extends StateBasedGame {

    // States:
    /**
     * The state wherein the user is actually playing a game.
     */
    private GameState gameState;

    /**
     * The state wherein the user is in the menu screen.
     */
    private MenuState menuState;

    /**
     * The state wherein the player has lost the game.
     */
    private GameOverState gameOverState;

    /**
     * The state wherein the user is in the high scores screen.
     */
    private HighScoresState highScoresState;

    // Components:
    /**
     * Handles the rendering of the GameBoard (left of the GameState screen).
     */
    private GameBoardComponent gameBoardComponent;

    /**
     * Handles the rendering of the ScoreBoard (in the right half of the
     * GameState screen).
     */
    private ScoreBoardComponent scoreBoardComponent;

    /**
     * Handles the rendering of a Tetrimino (within a GameBoardComponent).
     */
    private TetriminoComponent tetriminoComponent;

    /**
     * Handles the rendering of the nextTetrimino (in the right half of the
     * GameState screen).
     */
    private TetriminoPreviewComponent nextTetriminoComponent;

    // TODO: Refactor so MainView doesn't have a dependency on MainController.
    // However, this would require a revamp of the GameState class which is
    // unfortunately integral to the Slick API
    /**
     * The initialized controller object
     */
    private MainController controller;

    /**
     * Constructs as new <code>MainView</code> instance
     *
     * @param name The <code>GameEngine</code>'s name
     * @param mainController An instance of the initialized primary controller
     * class
     */
    public MainView(String name, MainController mainController) {
        super("Tetris");
        this.controller = mainController;
        initComponents();
    }

    /**
     * Initializes the components of <code>MainView</code>.
     *
     * @author Brooke Bullek
     */
    public void initComponents() {
        gameBoardComponent = new GameBoardComponent();
        scoreBoardComponent = new ScoreBoardComponent();
        tetriminoComponent = new TetriminoComponent();
        nextTetriminoComponent = new TetriminoPreviewComponent();
    }

    /**
     * Initializes <code>MainView</code>
     *
     * @param gc A generic game container that handles the game loop
     * @throws SlickException
     * @author Xizhou Li
     */
    @Override
    public void initStatesList(GameContainer gc) throws SlickException {
        // The frame will update 60 times a second
        gc.setTargetFrameRate(60);
        // This implements multiwindow rendering
        gc.setAlwaysRender(true);
        // The game will update 60 times a second
        gc.setMaximumLogicUpdateInterval(60);

        scoreBoardComponent.setFont(Resources.FONTS.get("activeHighScore"));

        // create new game states
        gameState = new GameState(controller);
        menuState = new MenuState(controller);
        gameOverState = new GameOverState(controller);
        highScoresState = new HighScoresState(controller);

        gc.setVSync(true);
        gc.setShowFPS(false);

        // add states to this MainView
        this.addState(menuState);
        this.addState(gameState);
        this.addState(gameOverState);
        this.addState(highScoresState);
    }

    /* Getters and setters */
    public GameState getGameState() {
        return gameState;
    }

    public void setGameState(GameState gameState) {
        this.gameState = gameState;
    }

    public MenuState getMenuState() {
        return menuState;
    }

    public void setMenuState(MenuState menuState) {
        this.menuState = menuState;
    }

    public GameOverState getGameOverState() {
        return gameOverState;
    }

    public void setGameOverState(GameOverState gameOverState) {
        this.gameOverState = gameOverState;
    }

    public MainController getMainController() {
        return controller;
    }

    public void setMainController(MainController mainController) {
        this.controller = mainController;
    }

    public GameBoardComponent getGameBoardComponent() {
        return gameBoardComponent;
    }

    public ScoreBoardComponent getScoreBoardComponent() {
        return scoreBoardComponent;
    }

    public TetriminoComponent getTetriminoComponent() {
        return tetriminoComponent;
    }

    public TetriminoPreviewComponent getTetriminoContainersComponent() {
        return nextTetriminoComponent;
    }

    public HighScoresState getHighScoresState() {
        return highScoresState;
    }
    /* End of getters and setters */

    /**
     * Renders GUI elements of the Game state. This includes the scoreboard,
     * gameboard, Tetrimino, static blocks, etc.
     *
     * @author Xizhou Li and Brooke Bullek
     * @param gc A generic game container that handles the game loop
     * @param g A graphics context used to render primitives to the canvas
     */
    public void renderGameState(GameContainer gc, Graphics g) {
        // draw the background underneath the game elements
        GameState.BACKGROUND.draw(0, 0,
                                  GameBoard.WIDTH * PixelDimension.BLOCK_WIDTH.getPixels(),
                                  GameBoard.HEIGHT * PixelDimension.BLOCK_WIDTH.getPixels());

        // draw the background underneath this component
        GameState.SIDE_PANEL.draw(PixelDimension.WINDOW_WIDTH.getPixels() / 2, 0,
                                  PixelDimension.WINDOW_WIDTH.getPixels() / 2,
                                  PixelDimension.WINDOW_HEIGHT.getPixels());

        scoreBoardComponent.render(gc, g); // draw the ScoreBoard
        tetriminoComponent.render(gc, g); // draw the active Tetrimino
        gameBoardComponent.render(gc, g); // draw the GameBoard

        nextTetriminoComponent.render(gc, g); // draw the next tetrimino indicator
    }

    /**
     * Renders GUI elements of the Menu state. This includes the title logo and
     * various buttons.
     *
     * @author Xizhou Li and Brooke Bullek
     * @param gc A generic game container that handles the game loop
     * @param g A graphics context used to render primitives to the canvas
     */
    public void renderMenuState(GameContainer gc, Graphics g) {
        // draw the menu's background
        menuState.getBackground().draw(0, 0,
                                       PixelDimension.WINDOW_WIDTH.getPixels(),
                                       PixelDimension.WINDOW_HEIGHT.getPixels());

        MenuState.TETRIS_LOGO.draw(
                PixelDimension.WINDOW_WIDTH.getPixels() / 2 - (int) (PixelDimension.WINDOW_WIDTH.getPixels() / 5.33),
                PixelDimension.WINDOW_HEIGHT.getPixels() / 12, 240, 160);
    }

    /**
     * Renders GUI elements of the Game Over state. This includes a game over
     * animation overlay and the regular GameState elements.
     *
     * @author Brooke Bullek
     * @param gc A generic game container that handles the game loop
     * @param g A graphics context used to render primitives to the canvas
     */
    public void renderGameOverState(GameContainer gc, Graphics g) {
        renderGameState(gc, g); // draw the underlying components first

        // render the GameOver screen components over the gameboard
        int widthOffset = 0;
        int heightOffset = PixelDimension.WINDOW_HEIGHT.getPixels() / 3;
        int animationWidth = PixelDimension.WINDOW_WIDTH.getPixels() / 2;
        int animationHeight = animationWidth / 4;
        GameOverState.GAME_OVER_ANIMATION.draw(widthOffset, heightOffset,
                                               animationWidth,
                                               animationHeight);
    }

    /**
     * Renders the high scores screen
     *
     * @param gc A generic game container that handles the game loop
     * @param g A graphics context used to render primitives to the canvas
     * @author Andre Amirsaleh
     */
    public void renderHighScoresState(GameContainer gc, Graphics g) {
        // draw the background
        highScoresState.getBackground().draw(0, 0,
                                             PixelDimension.WINDOW_WIDTH.getPixels(),
                                             PixelDimension.WINDOW_HEIGHT.getPixels());

        // Draw high scores and rankings
        int[] iHighScores = highScoresState.getIHighScores();
        List<String> sHighScores = highScoresState.getSHighScores();
        int rank = 0;
        int yRankLoc = 70;
        int xRankLoc = 200;
        String sRank;
        for (String sScore : sHighScores) {
            yRankLoc += 40;
            rank++;
            sRank = String.valueOf(rank);
            if (rank <= 10) {
                sRank = " " + sRank + ".  ";
            }

            // Draw rank (integer)
            g.setColor(Color.white);
            g.setFont(HighScoresState.RANKS_FONT);
            g.drawString(sRank, xRankLoc, yRankLoc);

            // Now draw score next to rank
            g.setColor(Color.pink);
            g.setFont(HighScoresState.VALUES_FONT);
            g.drawString(sScore, xRankLoc + 45, yRankLoc + 5);
        }
    }
}
