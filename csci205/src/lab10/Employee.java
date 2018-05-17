/* *****************************************
 * CSCI205 - Software Engineering and Design
 * Spring 2016
 *
 * Name: Andre Amirsaleh
 * Date: 2/17/16
 * Time: 1:50PM
 *
 * Project: csci205
 * Package: lab10
 * File: Employee
 * Description:
 * A very basic abstraction for an employee in a simple HR system
 * ****************************************
 */
package lab10;

/**
 * A basic representation for an Employee.
 *
 * @author Andre Amirsaleh
 */
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashSet;

/**
 * Employee - represents an employee in the database system
 *
 * @author Andre Amirsaleh
 */
public class Employee {

    private static HashSet<Integer> setOfIDs = new HashSet<>();


    private int empID;
    private String firstName;
    private String lastName;
    private int ssNum;
    private Date hireDate;
    private double salary;


    /**
     * Explicit construct to create new employee
     *
     * @param empID Employee ID
     * @param firstName First name
     * @param lastName Last name
     * @param ssNum Social Security number
     * @param hireDate Date hired
     * @param salary Salary
     */
    public Employee(int empID, String firstName, String lastName, int ssNum,
                    Date hireDate, double salary) {
        if (Employee.setOfIDs.contains(empID) || !Employee.isPositive(empID)) {
            this.empID = Employee.generateID();
        } else {
            this.empID = empID;
        }
        Employee.setOfIDs.add(this.empID);
        this.firstName = firstName;
        this.lastName = lastName;
        this.ssNum = ssNum;
        this.hireDate = hireDate;
        this.salary = salary;
    }

    /**
     * Generates a unique Employee ID
     *
     * @return (Integer) unique Employee ID
     */
    private static Integer generateID() {
        Integer uniqueID = -1;
        while (setOfIDs.contains(uniqueID) || !Employee.isPositive(uniqueID)) {
            uniqueID += 1;
        }
        return uniqueID;
    }

    /**
     * Returns true if <code>ID</code> is non-positive; returns false otherwise
     *
     * @param ID (int) Employee ID
     * @return (boolean) truth value of whether <code>ID</code> is positive
     */
    private static boolean isPositive(int ID) {
        return ID > 0;
    }

    /**
     * Get the value of empID
     *
     * @return (int) Employee's ID number
     */
    public int getEmpID() {
        return empID;
    }

    /**
     * Get the value of firstName
     *
     * @return (String) first name of Employee
     */
    public String getFirstName() {
        return firstName;
    }

    /**
     * Get the value of lastName
     *
     * @return (String) last name of Employee
     */
    public String getLastName() {
        return lastName;
    }

    /**
     * Get the value of ssNum
     *
     * @return (int) social security number of Employee
     */
    public int getSsNum() {
        return ssNum;
    }

    /**
     * Get the value of hireDate
     *
     * @return (Date) date Employee was hired
     */
    public Date getHireDate() {
        return hireDate;
    }

    /**
     * Get the value of salary
     *
     * @return (double) salary of Employee
     */
    public double getSalary() {
        return salary;
    }

    /**
     * Change the name of the employee
     *
     * @param first - New first name
     * @param last - New last name
     */
    public void changeName(String first, String last) {
        this.firstName = first;
        this.lastName = last;
    }

    /**
     * Raise the salary by <code>salaryAdj</code> dollars.
     *
     * @param salaryAdj - amount to add to the current salary
     * @return the new salary
     */
    public double raiseSalary(double salaryAdj) {
        this.salary += salaryAdj;
        return this.salary;
    }


    /**
     * Return a string representation of the Employee
     *
     * @return the String of comma delimited values
     */
    @Override
    public String toString() {
        String s = this.empID + "," + this.lastName + "," + this.firstName;
        s += String.format(",%09d", this.ssNum);
        s += "," + HRUtility.dateToStr(this.hireDate);
        s += String.format(",%.2f", this.salary);
        return s;
    }

    /**
     * equals method to see if two Employees are the same
     *
     * @param obj Object with which to compare Employee
     *
     * @return (boolean) truth value of Employee == <code>obj</code>
     */
    @Override
    public boolean equals(Object obj) {
        if (obj == null) {
            return false;
        }
        if (getClass() != obj.getClass()) {
            return false;
        }
        final Employee other = (Employee) obj;
        if (this.ssNum != other.ssNum) {
            return false;
        }
        return true;
    }

}
