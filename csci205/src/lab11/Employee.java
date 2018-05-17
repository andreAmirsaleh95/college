/* *****************************************
 * CSCI205 - Software Engineering and Design
 * Spring 2016
 *
 * Name: Andre Amirsaleh
 * Date: 2/24/16
 * Time: 1:10PM
 *
 * Project: csci205
 * Package: lab11
 * File: Employee
 * Description:
 * A very basic abstraction for an employee in a simple HR system
 * ****************************************
 */
package lab11;

/**
 * A basic representation for an Employee.
 *
 * @author Andre Amirsaleh
 */
import java.util.Date;
import java.util.HashSet;

enum SortType {
    SORT_BY_LASTNAME, SORT_BY_ID;
}

/**
 * Employee - represents an employee in the database system
 *
 * @author Andre Amirsaleh
 */
public class Employee implements Payable, Comparable<Employee> {

    private static SortType sortType;
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
        Employee.sortType = SortType.SORT_BY_ID;
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
        return other.ssNum == this.ssNum;
    }

    /**
     * Calculates amount to pay based on number of hours worked
     *
     * @param numHours Number of hours worked
     * @return (double) amount to pay
     */
    @Override
    public double calculatePay(double numHours) {
        double hourlyRate = this.getSalary() / (40 * 52);
        return hourlyRate * 40 + hourlyRate * 1.5 * (numHours - 40);
    }

    /**
     * Returns the String to place in the "pay to" field of a check
     *
     * @return (String) first and last name of Employee
     */
    @Override
    public String getPayTo() {
        return this.getFirstName() + " " + this.getLastName();
    }

    /**
     * Returns String to place in memo field of check
     *
     * @return (String) message to put in memo field of check
     */
    @Override
    public String getPayMemo() {
        return String.format("Employee ID: %d, Pay Date: %s", this.getEmpID(),
                             HRUtility.dateToStr(new Date()));
    }

    /**
     * Sets the method by which Employees are sorted
     *
     * @param sortType (SortType)
     */
    public static void setSortType(SortType sortType) {
        Employee.sortType = sortType;
    }

    /**
     * Compares this Employee to <code>emp</code> in order to sort Employees
     *
     * @param emp (Employee) to compare to
     * @return -1, 0, or 1 depending on the two Employee instances an the
     * current sortType (attribute)
     */
    @Override
    public int compareTo(Employee emp) {
        if (Employee.sortType == SortType.SORT_BY_ID) {
            if (this.empID < emp.getEmpID()) {
                return -1;
            } else if (this.empID == emp.getEmpID()) {
                return 0;
            } else {
                return 1;
            }
        } else {
            return this.lastName.compareToIgnoreCase(emp.getLastName());
        }
    }

}
