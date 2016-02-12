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
    r_and_d = Department.new("Research and Development")
    employee = Employee.new("Jean Luc Picard", "make.it.so@starfleet.org", "272-436-5649", 50000)
    r_and_d.hire(employee)
    assert r_and_d.roster.include?(employee)
  end

  def test_can_get_employee_name
    r_and_d = Department.new("Research and Development")
    employee = Employee.new("Jean Luc Picard", "make.it.so@starfleet.org", "272-436-5649", 50000)
    r_and_d.hire(employee)
    assert_equal "Jean Luc Picard", r_and_d.roster[0].name
  end

  def test_can_get_employee_salary
    r_and_d = Department.new("Research and Development")
    employee = Employee.new("Jean Luc Picard", "make.it.so@starfleet.org", "272-436-5649", 50000)
    r_and_d.hire(employee)
    assert_equal 50000, r_and_d.roster[0].salary
  end

  def test_can_get_department_name
    r_and_d = Department.new("Research and Development")
    assert_equal "Research and Development", r_and_d.name
  end

  def test_can_get_total_salary_of_department
    r_and_d = Department.new("Research and Development")
    employee_1 = Employee.new("Jean Luc Picard", "make.it.so@starfleet.org", "272-436-5649", 50000)
    employee_2 = Employee.new("James T. Kirk", "beam.me.up@starfleet.org", "272-436-8912", 55000)
    employee_3 = Employee.new("Schn Tgai Spock", "live.long@starfleet.org", "266-354-2833", 60000)
    r_and_d.hire(employee_1)
    r_and_d.hire(employee_2)
    r_and_d.hire(employee_3)
    assert_equal 165000, r_and_d.budget?
  end

  def test_can_add_employee_review_text_to_employee
    employee = Employee.new("Jean Luc Picard", "make.it.so@starfleet.org", "272-436-5649", 50000)
    employee.review=("Potential conflict in loyalties. Speaks in a condescending manner of short sentences and commands. Nevertheless, he commands strong respect and gets the job done.")
    assert_equal "Potential conflict in loyalties. Speaks in a condescending manner of short sentences and commands. Nevertheless, he commands strong respect and gets the job done.", employee.review
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
