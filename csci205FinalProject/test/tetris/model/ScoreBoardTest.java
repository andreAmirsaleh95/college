/* *****************************************
 * CSCI205 - Software Engineering and Design
 * Spring 2016
 *
 * Name: Andre Amirsaleh, Brooke Bullek, Daniel Vasquez, Xizhou Li
 * Date: May 2, 2016
 * Time: 9:57:57 PM
 *
 * Project: csci205FinalProject
 * Package: tetris.model
 * File: ScoreBoardTest
 * Description:
 *
 * ****************************************
 */
package tetris.model;

import org.junit.After;
import static org.junit.Assert.assertEquals;
import org.junit.Before;
import org.junit.Test;

/**
 * Tests functionality of the ScoreBoard class.
 *
 * @author Brooke Bullek
 */
public class ScoreBoardTest {

    private ScoreBoard instance;

    public ScoreBoardTest() {
        instance = new ScoreBoard();
    }

    @Before
    public void setUp() {
    }

    @After
    public void tearDown() {
        instance.setPoints(0);
    }

    /**
     * Test of addPoints method, of class ScoreBoard.
     */
    @Test
    public void testAddPoints() {
        System.out.println("addPoints");
        int points = ScoreBoard.HARD_DROP_POINTS_PER_ROW * 4 + ScoreBoard.POINTS_PER_LINE;
        instance.addPoints(points);
        int result = instance.getPoints();
        int expResult = 108;
        assertEquals(result, expResult);
    }
}
