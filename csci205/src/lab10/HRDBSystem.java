/* *****************************************
 * CSCI205 - Software Engineering and Design
 * Spring 2016
 *
 * Name: Andre Amirsaleh
 * Date: Feb 18, 2016
 * Time: 7:57:53 PM
 *
 * Project: csci205
 * Package: lab10
 * File: HRDBSystem
 * Description:
 *
 * ****************************************
 */
package lab10;

import java.text.ParseException;
import static lab10.HRUtility.displayManager;

/**
 * Human Resource Database System
 *
 * @author Andre Amirsaleh
 */
public class HRDBSystem {

    /**
     * main method to test Employee and Manager classes
     *
     * @param args Command line arguments
     * @throws java.text.ParseException
     * @throws lab10.ManagerException
     */
    public static void main(String[] args) throws ParseException, ManagerException {
        Manager mgr = new Manager(0, "Keith", "Buffinton", 101010101,
                                  HRUtility.strToDate("1997-01-15"), 150000,
                                  "ENGINEERING");
        Manager mgr2 = new Manager(1, "Mike", "Jones", 121212121,
                                   HRUtility.strToDate("1997-01-15"), 100000,
                                   "ADMIN");
        Employee emp = new Employee(1, "Brian", "King", 123456789,
                                    HRUtility.strToDate("2010-08-20"), 60000);
        Employee emp2 = new Employee(2, "Method", "Man", 343434343,
                                     HRUtility.strToDate("1997-01-15"), 11);
        Employee emp3 = new Employee(201, "Andre", "Amirsaleh", 454545454,
                                     HRUtility.strToDate("1997-01-15"), 15);
        Employee emp4 = new Employee(4, "Sean", "Paul", 565656565,
                                     HRUtility.strToDate("1997-01-15"), 20);
        Employee emp5 = new Employee(0, "Kanye", "West", 676767676,
                                     HRUtility.strToDate("1997-01-15"), 30);
        Employee emp6 = new Employee(200, "Ghostface", "Killah", 898989898,
                                     HRUtility.strToDate("1997-01-15"), 40);

        /*System.out.println(mgr);
         System.out.println(mgr2);
         System.out.println(emp);
         System.out.println(emp2);
         System.out.println(emp3);
         System.out.println(emp4);
         System.out.println(emp5);
         System.out.println(emp6);*/
        /*List<Employee> empList = new ArrayList<>();
         empList.add(mgr);
         empList.add(mgr2);
         empList.add(emp);
         empList.add(emp2);
         empList.add(emp3);
         empList.add(emp4);
         empList.add(emp5);
         empList.add(emp6);
         displayEmployees(empList);*/
        mgr.addEmployee(emp);
        mgr.addEmployee(emp2);
        mgr.addEmployee(emp3);

        mgr2.addEmployee(emp4);
        mgr2.addEmployee(emp5);
        mgr2.addEmployee(emp6);

        displayManager(mgr);
        System.out.println();
        displayManager(mgr2);
    }
}
