/* *****************************************
 * CSCI205 - Software Engineering and Design
 * Spring 2016
 *
 * Name: Andre Amirsaleh
 * Date: Feb 29, 2016
 * Time: 9:46:13 PM
 *
 * Project: csci205
 * Package: lab12
 * File: ScanWebPageTest
 * Description:
 *
 * ****************************************
 */
package lab12;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.net.MalformedURLException;
import java.net.UnknownHostException;
import org.junit.After;
import static org.junit.Assert.fail;
import org.junit.Before;
import org.junit.Test;

/**
 *
 * @author amirsa
 */
public class ScanWebPageTest {

    public ScanWebPageTest() {
    }

    @Before
    public void setUp() {
    }

    @After
    public void tearDown() {
    }

    /**
     * Test of bufferWebPage using a valid web site address
     */
    @Test
    public void testGetWebPage() {
        try {
            ScanWebPage.bufferWebPage("http://www.bucknell.edu");
        } catch (Exception ex) {
            fail("An Exception should not have been thrown.");
        }
    }

    /**
     * Test of bufferWebPage to throw MalformedURLException
     *
     * @throws java.io.IOException
     */
    @Test(expected = MalformedURLException.class)
    public void testMalformedURLException() throws IOException {
        ScanWebPage.bufferWebPage("www.bucknell.edu");
    }

    /**
     * Test of bufferWebPage to throw UnknownHostException
     *
     * @throws java.io.IOException
     */
    @Test(expected = UnknownHostException.class)
    public void testUnknownHostException() throws IOException {
        ScanWebPage.bufferWebPage("http://www.bucknell.ed");
    }

    /**
     * Test of bufferWebPage to throw UnknownHostException
     *
     * @throws java.io.IOException
     */
    @Test(expected = IllegalArgumentException.class)
    public void testIllegalArgumentException() throws IOException {
        ScanWebPage.bufferWebPage("http:\\www.bucknell.edu");
    }

    /**
     * Test of bufferWebPage to throw FileNotFoundException
     *
     * @throws java.io.IOException
     */
    @Test(expected = FileNotFoundException.class)
    public void testFileNotFoundException() throws IOException {
        ScanWebPage.bufferWebPage("http://www.bucknell.edu/blah.html");
    }
}
