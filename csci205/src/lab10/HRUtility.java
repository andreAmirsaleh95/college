/* *****************************************
 * CSCI205 - Software Engineering and Design
 * Spring 2016
 *
 * Name: Andre Amirsaleh
 * Date: Feb 23, 2016
 * Time: 4:31:45 PM
 *
 * Project: csci205
 * Package: lab10
 * File: HRUtility
 * Description:
 *
 * ****************************************
 */
package lab10;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

/**
 *
 * @author Andre Amirsaleh
 */
public final class HRUtility {
    private static SimpleDateFormat empDateFormat = new SimpleDateFormat(
            "yyyy-MM-dd");

    public static void displayManager(Manager mgr) {
        System.out.printf("Manager:     %s %s\n", mgr.getFirstName(),
                          mgr.getLastName());
        System.out.printf("Department:  %s\n", mgr.getDeptName());
        System.out.printf("# Employees: %d\n", mgr.getEmpList().size());
        displayEmployees(mgr.getEmpList());
    }

    /**
     * Prints Employee ID, first name, last name of given Employee
     *
     * @param emp Employee object to display
     */
    public static void displayEmployee(Employee emp) {
        System.out.printf("%3d: %s %s", emp.getEmpID(), emp.getFirstName(),
                          emp.getLastName());
        if (emp instanceof Manager) {
            System.out.print("[MANAGER]");
        }
        System.out.println();
    }

    /**
     * Displays Employee ID and full name for each Employee in
     * <code>listOfEmps</code>
     *
     * @param listOfEmps List of Employee objects
     */
    public static void displayEmployees(List<Employee> listOfEmps) {
        for (Employee emp : listOfEmps) {
            displayEmployee(emp);
        }
    }

    /**
     * Helper method to parse a date string into a date object. This is really
     * here just to show how to deal with an exception that may be thrown in a
     * method.
     *
     * @param sDate - a date string
     * @return a <code>Date</code> object
     * @throws ParseException if the string cannot be parse correctly.
     */
    public static Date strToDate(String sDate) throws ParseException {
        return empDateFormat.parse(sDate);
    }

    /**
     * Converts Date object to a string
     *
     * @param date
     * @return (String) the given date as a String
     */
    public static String dateToStr(Date date) {
        return empDateFormat.format(date);
    }
}
