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
 * File: Manager
 * Description:
 *
 * ****************************************
 */
package lab11;

import java.util.Date;
import java.util.LinkedList;
import java.util.List;

/**
 * Checked exception representing any issues that might arise from the Manager
 * class
 *
 * @author Andre Amirsaleh
 */
class ManagerException extends Exception {

    /**
     * Initializes ManagerException
     *
     * @param message
     */
    public ManagerException(String message) {
        super(message);
    }
}

/**
 * Enum for list of departments
 *
 * @author Andre Amirsaleh
 */
enum DeptType {
    ENGINEERING, HR, ADMIN, STAFF, OTHER;
}

/**
 * Manager class - subclass of Employee
 *
 * @author Andre Amirsaleh
 */
public class Manager extends Employee {

    private DeptType dept;

    private List<Employee> empList;

    /**
     * Constructor for Manager
     *
     * @param empID (int) Employee ID
     * @param firstName (String) First name
     * @param lastName (String) Last name
     * @param ssNum (int) Social security number
     * @param hireDate (Date) Date hired
     * @param salary (double) Salary
     * @param dept (String) Department
     */
    public Manager(int empID, String firstName, String lastName, int ssNum,
                   Date hireDate, double salary, String deptName) {
        super(empID, firstName, lastName, ssNum, hireDate, salary);
        this.dept = DeptType.valueOf(deptName);
        this.empList = new LinkedList<>();
    }

    /**
     * Constructor for Manager
     *
     * @param empID (int) Employee ID
     * @param firstName (String) First name
     * @param lastName (String) Last name
     * @param ssNum (int) Social security number
     * @param hireDate (Date) Date hired
     * @param salary (double) Salary
     * @param dept (DeptType) Department
     */
    public Manager(int empID, String firstName, String lastName, int ssNum,
                   Date hireDate, double salary, DeptType dept) {
        super(empID, firstName, lastName, ssNum, hireDate, salary);
        this.dept = dept;
    }

    /**
     * Adds given Employee to list of managed Employees
     *
     * @param emp Employee object to add to list of managed Employees
     * @throws ManagerException
     */
    public void addEmployee(Employee emp) throws ManagerException {
        for (Employee e : this.empList) {
            if (e.equals(emp)) {
                throw new ManagerException("Employee already added");
            }
        }

        this.empList.add(emp);
    }

    /**
     * Accesses Employee list attribute
     *
     * @return List of Employees
     */
    public List<Employee> getEmpList() {
        return this.empList;
    }

    /**
     * Gets department attribute
     *
     * @return (DeptType) Department
     */
    public DeptType getDept() {
        return this.dept;
    }

    /**
     * Removes an Employee from the list of managed Employees
     *
     * @param emp Employee to remove
     * @throws ManagerException
     */
    public void removeEmployee(Employee emp) throws ManagerException {
        boolean found = false;
        for (Employee e : this.empList) {
            if (e.equals(emp)) {
                found = true;
                break;
            }
        }
        if (found == true) {
            empList.remove(emp);
        } else {
            throw new ManagerException("Employee not listed");
        }
    }

    /**
     * Sets department attribute
     *
     * @param dept (DeptType) Department
     */
    public void setDept(DeptType dept) {
        this.dept = dept;
    }

    /**
     * Get the value of deptName
     *
     * @return the value of deptName
     */
    public String getDeptName() {
        return this.dept.toString();
    }

    /**
     * Set the value of deptName
     *
     * @param deptName new value of deptName
     */
    public void setDeptName(String deptName) {
        this.dept = DeptType.valueOf(deptName);
    }

    @Override
    public String toString() {
        return super.toString() + ",MANAGER," + this.getDeptName();
    }
}
