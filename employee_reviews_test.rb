require 'minitest/autorun'
require 'minitest/pride'

require './department.rb'

class EmployeeReviewsTest < Minitest::Test
  def test_can_create_new_department
    assert Department
    department = Department.new("Research and Development")
  end

  def test_can_create_new_employees
    assert Employee
    employee = Employee.new("Augustine", "hungry.hippo@gmail.com", "919-477-8253", 77777)
  end

  def test_can_add_employ_to_department
    sales = Department.new("Sales")
    employee = Employee.new("Jean Luc Picard", "make.it.so@starfleet.org", "272-436-5649", 0)
    sales.hire(employee)
    assert sales.roster.include?(employee)
  end






end





=begin You want to keep track of employees (with their names,
email addresses, phone numbers, and salaries), departments (with
their names), and which employees are in which department.
You should be able to:

* Create a new department (given its name).
* Create a new employee (given his/her name, email address,
  phone number, and salary).
* Add an employee to a department.
* Get an employee's name.
* Get an employee's salary.
* Get a department's name.
* Get a total salary for all employees in a department.
* Add some employee review text (a paragraph or two) to an employee.
* Mark whether an employee is performing satisfactorily or not
  satisfactorily.
* Give a raise to an individual.  You decide if this makes sense in
  dollars or in percent.
* Give raises to a department's employees.  You must pass this method
  a total dollar amount, and it must distribute the raise amounts
  reasonably to the department's employees.  Only employees who are
  performing satisfactorily should get raises.

Commit your code after you complete each requirement (or more often).

At this stage, your code should:

* Use keyword arguments at least once.

Finally, all of this code must be written using test-driven
development.  Your test suite should have at least one complete
example (also known as a "pathological" example) of how the two
classes can be used in the real world.

=end
