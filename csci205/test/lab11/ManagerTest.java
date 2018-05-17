/* *****************************************
 * CSCI205 - Software Engineering and Design
 * Spring 2016
 *
 * Name: Andre Amirsaleh
 * Date: Feb 24, 2016
 * Time: 1:10 PM
 *
 * Project: csci205
 * Package: lab11
 * File: ManagerTest
 * Description:
 *
 * ****************************************
 */
package lab11;

import java.text.ParseException;
import java.util.ArrayList;
import org.junit.After;
import static org.junit.Assert.assertEquals;
import org.junit.Before;
import org.junit.Test;

/**
 *
 * @author Andre Amirsaleh
 */
public class ManagerTest {

    ArrayList<Employee> listOfEmps;
    Manager mgr;

    public ManagerTest() {
        listOfEmps = new ArrayList<>();

    }

    @Before
    public void setUp() throws ParseException, ManagerException {
        mgr = new Manager(0, "Keith", "Buffinton", 101010101,
                          HRUtility.strToDate("1997-01-15"), 150000,
                          "ENGINEERING");
        listOfEmps.add(new Employee(1, "Brian", "King", 123456789,
                                    HRUtility.strToDate("2010-08-20"), 60000));
        listOfEmps.add(new Employee(2, "Method", "Man", 343434343,
                                    HRUtility.strToDate("1997-01-15"), 11));
        listOfEmps.add(new Employee(201, "Andre", "Amirsaleh", 454545454,
                                    HRUtility.strToDate("1997-01-15"), 15));
        listOfEmps.add(new Employee(4, "Sean", "Paul", 565656565,
                                    HRUtility.strToDate("1997-01-15"), 20));
        listOfEmps.add(new Employee(0, "Kanye", "West", 676767676,
                                    HRUtility.strToDate("1997-01-15"), 30));
        listOfEmps.add(new Employee(200, "Ghostface", "Killah", 898989898,
                                    HRUtility.strToDate("1997-01-15"), 40));
        mgr.addEmployee(listOfEmps.get(0));
        mgr.addEmployee(listOfEmps.get(1));
        mgr.addEmployee(listOfEmps.get(2));
    }

    @After
    public void tearDown() {
        listOfEmps = null;
    }

    /**
     * Test of addEmployee method, of class Manager.
     *
     * @throws java.lang.Exception
     */
    @Test
    public void testAddEmployee() throws Exception {
        mgr.addEmployee(listOfEmps.get(3));
        assertEquals(mgr.getEmpList().get(3), listOfEmps.get(3));
    }

    /**
     * Test of getEmpList method, of class Manager.
     *
     * @throws lab10.ManagerException
     */
    @Test
    public void testGetEmpList() throws ManagerException {
        assertEquals(listOfEmps.subList(0, 3), mgr.getEmpList());
    }

    /**
     * Test of removeEmployee method, of class Manager.
     *
     * @throws java.lang.Exception
     */
    @Test
    public void testRemoveEmployee() throws Exception {
        assertEquals(mgr.getEmpList().size(), 3);
        mgr.removeEmployee(mgr.getEmpList().get(2));
        assertEquals(mgr.getEmpList().size(), 2);
    }

    /**
     * Tests for ManagerException in addEmployee()
     *
     * @throws lab10.ManagerException
     */
    @Test(expected = ManagerException.class)
    public void testAddEmployeeException() throws ManagerException {
        mgr.addEmployee(mgr.getEmpList().get(0));
    }

    @Test(expected = ManagerException.class)
    public void testRemoveEmployeeException() throws ManagerException {
        mgr.removeEmployee(listOfEmps.get(listOfEmps.size() - 1));
    }

}
