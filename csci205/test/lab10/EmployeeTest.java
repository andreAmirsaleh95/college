/* *****************************************
 * CSCI205 - Software Engineering and Design
 * Spring 2016
 *
 * Name: Andre Amirsaleh
 * Date: Feb 20, 2016
 * Time: 9:55:10 PM
 *
 * Project: csci205
 * Package: lab10
 * File: EmployeeTest
 * Description:
 *
 * ****************************************
 */
package lab10;

import java.text.ParseException;
import org.junit.After;
import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;
import org.junit.Before;
import org.junit.Test;

/**
 *
 * @author Andre Amirsaleh
 */
public class EmployeeTest {

    private Employee emp;

    public EmployeeTest() {
    }

    @Before
    public void setUp() throws ParseException {
        emp = new Employee(1, "Brian", "King", 123456789, HRUtility.strToDate(
                           "2010-08-20"), 60000);
    }

    @After
    public void tearDown() {
        emp = null;
    }

    /**
     * Test of changeName method, of class Employee.
     */
    @Test
    public void testChangeName() {
        emp.changeName("Andre", "Amirsaleh");
        assertEquals(emp.getFirstName(), "Andre");
        assertEquals(emp.getLastName(), "Amirsaleh");
    }

    /**
     * Test of raiseSalary method, of class Employee.
     */
    @Test
    public void testRaiseSalary() {
        double salaryAdj = 5000;
        double expResult = emp.getSalary() + salaryAdj;
        double result = emp.raiseSalary(salaryAdj);
        assertEquals(expResult, result, 0.0);
    }

    /**
     * Test of equals method, of class Employee.
     *
     * @throws java.text.ParseException
     */
    @Test
    public void testEquals() throws ParseException {
        Employee emp2 = new Employee(2, "Method", "Man", 343434343,
                                     HRUtility.strToDate("1997-01-15"), 11);
        assertFalse(emp.equals(emp2));
        assertTrue(emp.equals(emp));
    }
}
