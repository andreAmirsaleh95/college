/* *****************************************
* CSCI205 - Software Engineering and Design
* Spring 2016
*
* Name: Andre Amirsaleh
* Date: Feb 16, 2016
* Time: 4:55:18 PM
*
* Project: csci205
* Package: lab09
* File: CashRegisterTest
* Description:
*
* ****************************************
 */
package lab09;

import java.util.LinkedList;
import java.util.List;
import org.junit.After;
import static org.junit.Assert.*;
import org.junit.Before;
import org.junit.Test;

/**
 *
 * @author Andre Amirsaleh
 */
public class CashRegisterTest {
    static final double EPSILON = 1.0E-12;
    private CashRegister instance;

    public CashRegisterTest() {
    }

    @Before
    public void setUp() {
        instance = new CashRegister();
    }

    @After
    public void tearDown() {
        instance = null;
    }

    /**
     * Test of getPurchaseCount method, of class CashRegister.
     */
    @Test
    public void testGetPurchaseCount() {
        System.out.println("getPurchaseCount");
        CashRegister instance = new CashRegister();
        // Test the initial state = should have NO items
        assertEquals(0, instance.getPurchaseCount());

        // Now set up a test of 2 items
        instance.scanItem(0.55);
        instance.scanItem(1.27);
        int expResult = 2;
        int result = instance.getPurchaseCount();
        assertEquals(expResult, result);
    }

    /**
     * Test of getListOfPurchases method, of class CashRegister.
     */
    @Test
    public void testGetListOfPurchases() {
        System.out.println("getListOfPurchases");
        CashRegister instance = new CashRegister();
        List<Double> expResult = new LinkedList<>();
        assertEquals(expResult, instance.getListOfPurchases());

        // Scan two items:
        instance.scanItem(0.55);
        instance.scanItem(1.27);

        // Add items to expected result:
        expResult.add(0.55);
        expResult.add(1.27);

        List<Double> result = instance.getListOfPurchases();
        assertEquals(expResult, result);
    }

    /**
     * Test of getTransactionTotal method, of class CashRegister.
     */
    @Test
    public void testGetTransactionTotal() {
        System.out.println("getTransactionTotal");
        CashRegister instance = new CashRegister();
        assertEquals(0, instance.getTransactionTotal(), EPSILON);

        // Now, set up a test of two items:
        instance.scanItem(0.55);
        instance.scanItem(1.27);
        double expResult = 1.82;
        double result = instance.getTransactionTotal();
        assertEquals(expResult, result, EPSILON);
    }

    /**
     * Test of getPaymentCollected method, of class CashRegister.
     */
    @Test
    public void testGetPaymentCollected() {
        System.out.println("getPaymentCollected");
        CashRegister instance = new CashRegister();
        instance.collectPayment(Money.TWENTY, 1);
        double expResult = 20.0;
        double result = instance.getPaymentCollected();
        assertEquals(expResult, result, EPSILON);
    }

    /**
     * Test of giveChange method, of class CashRegister.
     *
     * @throws java.lang.Exception
     */
    @Test
    public void testGiveChange() throws Exception {
        System.out.println("giveChange");
        CashRegister instance = new CashRegister();
        assertEquals(0, instance.giveChange(), EPSILON);

        // Now, set up a test of two items:
        instance.scanItem(0.55);
        instance.scanItem(1.27);
        instance.collectPayment(Money.FIVE, 1);
        double expResult = 3.18;
        double result = instance.giveChange();
        assertEquals(expResult, result, EPSILON);
    }

    @Test(expected = IllegalArgumentException.class)
    public void testScanItemLowException() {
        CashRegister instance = new CashRegister();
        instance.scanItem(-0.5);
    }

    @Test(expected = IllegalArgumentException.class)
    public void testScanItemHighException() {
        CashRegister instance = new CashRegister();
        instance.scanItem(1E6);
    }

    @Test(expected = IllegalArgumentException.class)
    public void testCollectPaymentException() {
        CashRegister instance = new CashRegister();
        instance.collectPayment(Money.TWENTY, -1);
    }

    @Test(expected = ChangeException.class)
    public void testGiveChangeException() throws ChangeException {
        CashRegister instance = new CashRegister();
        instance.scanItem(0.55);
        instance.scanItem(1.27);
        instance.collectPayment(Money.DOLLAR, 1);
        instance.giveChange();
    }

    @Test
    public void testEquals() {
        CashRegister instance2 = new CashRegister();
        assertEquals(instance, instance2);
        instance.scanItem(0.55);
        instance.scanItem(1.27);
        instance.collectPayment(Money.TWENTY, 1);
        assertFalse(instance.equals(instance2));
        instance2.scanItem(0.55);
        instance2.scanItem(1.27);
        instance2.collectPayment(Money.TWENTY, 1);
        assertTrue(instance.equals(instance2));
    }
}
