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
 * File: HRDBSystem
 * Description:
 *
 * ****************************************
 */
package lab11;

import java.text.ParseException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

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
     * @throws lab11.ManagerException
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

        Contractor cont1 = new Contractor(73, "Bob", "Builder", 342942039, 30.00);
        Contractor cont2 = new Contractor(17, "Dark", "Knight", 655566555, 40.00);

        List<Employee> empList = new ArrayList<>();
        empList.add(mgr);
        empList.add(mgr2);
        empList.add(emp);
        empList.add(emp2);
        empList.add(emp3);
        empList.add(emp4);
        empList.add(emp5);
        empList.add(emp6);

        mgr.addEmployee(emp);
        mgr.addEmployee(emp2);
        mgr.addEmployee(emp3);

        mgr2.addEmployee(emp4);
        mgr2.addEmployee(emp5);
        mgr2.addEmployee(emp6);

        /*
         // Create an account
         Account acc = new Account(2000.0);
         System.out.println(acc);
         // Test out a couple of payments, intentionally throwing an exception // with the second payment
         try {
         System.out.println(
         "TEST: Printing a check to employee id: " + emp.getEmpID());
         acc.processCheck(emp, 50); // 40 hrs + 10 hrs overtime
         System.out.println(
         "TEST: Printing a check to contractor id: " + cont1.getId());
         acc.processCheck(cont1, 35);
         } catch (InsufficientFundsException e) {
         System.out.println(e.getMessage());
         }
         // Verify that funds were debited from the account System.out.println(acc);
         System.out.println(acc);*/
        System.out.println("*** Employees BEFORE SORT ***");
        HRUtility.displayEmployees(empList);

        System.out.println("*** Employees AFTER SORT_BY_LASTNAME ***");
        Employee.setSortType(SortType.SORT_BY_LASTNAME);
        Collections.sort(empList);
        HRUtility.displayEmployees(empList);

        System.out.println("*** Employees AFTER SORT_BY_ID ***");
        Employee.setSortType(SortType.SORT_BY_ID);
        Collections.sort(empList);
        HRUtility.displayEmployees(empList);
    }
}
