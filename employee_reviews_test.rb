require 'minitest/autorun'
require 'minitest/pride'

require './department.rb'

class EmployeeReviewsTest < Minitest::Test
  def test_can_create_new_department
    department = Department.new("Party Planning Committee")
    assert Department
    assert_equal Department, department.class
  end

  def test_can_create_new_employees
    employee = Employee.new("Augustine", "hungry.hippo@gmail.com", "919-477-8253", 77777)
    assert Employee
    assert_equal Employee, employee.class
  end

  def test_can_add_employ_to_department
    ppc = Department.new("Party Planning Committee")
    employee = Employee.new("Jean Luc Picard", "make.it.so@starfleet.org", "272-436-5649", 50000.00)
    ppc.hire(employee)
    assert ppc.roster.include?(employee)
  end

  def test_can_get_employee_name
    ppc = Department.new("Party Planning Committee")
    employee = Employee.new("Jean Luc Picard", "make.it.so@starfleet.org", "272-436-5649", 50000.00)
    ppc.hire(employee)
    assert_equal "Jean Luc Picard", ppc.roster[0].name
  end

  def test_can_get_employee_salary
    ppc = Department.new("Party Planning Committee")
    employee = Employee.new("Jean Luc Picard", "make.it.so@starfleet.org", "272-436-5649", 50000.00)
    ppc.hire(employee)
    assert_equal 50000.00, ppc.roster[0].salary
  end

  def test_can_get_department_name
    ppc = Department.new("Party Planning Committee")
    assert_equal "Party Planning Committee", ppc.name
  end

  def test_can_get_total_salary_of_department
    ppc = Department.new("Party Planning Committee")
    employee_1 = Employee.new("Jean Luc Picard", "make.it.so@starfleet.org", "272-436-5649", 50000.00)
    employee_2 = Employee.new("James T. Kirk", "beam.me.up@starfleet.org", "272-436-8912", 55000.00)
    employee_3 = Employee.new("Schn Tgai Spock", "live.long@starfleet.org", "266-354-2833", 60000.00)
    ppc.hire(employee_1)
    ppc.hire(employee_2)
    ppc.hire(employee_3)
    assert_equal 165000.00, ppc.total_salary?
  end

  def test_can_add_employee_review_text_to_employee
    employee = Employee.new("Schn Tgai Spock", "live.long@starfleet.org", "266-354-2833", 60000.00)
    employee.review=("Spock is a very positive person and encourages those around him, but he has not done well technically this year.  There are two areas in which Spock has room for improvement.  First, when communicating verbally (and sometimes in writing), he has a tendency to use more words than are required.  This conversational style does put people at ease, which is valuable, but it often makes the meaning difficult to isolate, and can cause confusion. Second, when discussing new requirements with project managers, less of the information is retained by Spock long-term than is expected.  This has a few negative consequences: 1) time is spent developing features that are not useful and need to be re-run, 2) bugs are introduced in the code and not caught because the tests lack the same information, and 3) clients are told that certain features are complete when they are inadequate.  This communication limitation could be the fault of project management, but given that other developers appear to retain more information, this is worth discussing further.")
    assert_equal "Spock is a very positive person and encourages those around him, but he has not done well technically this year.  There are two areas in which Spock has room for improvement.  First, when communicating verbally (and sometimes in writing), he has a tendency to use more words than are required.  This conversational style does put people at ease, which is valuable, but it often makes the meaning difficult to isolate, and can cause confusion. Second, when discussing new requirements with project managers, less of the information is retained by Spock long-term than is expected.  This has a few negative consequences: 1) time is spent developing features that are not useful and need to be re-run, 2) bugs are introduced in the code and not caught because the tests lack the same information, and 3) clients are told that certain features are complete when they are inadequate.  This communication limitation could be the fault of project management, but given that other developers appear to retain more information, this is worth discussing further.", employee.review
  end

  def test_can_mark_whether_employee_performance_is_satisfactory_or_not
    employee_1 = Employee.new("Schn Tgai Spock", "it.is.complicated@starfleet.org", "266-354-2833", 60000.00)
    employee_2 = Employee.new("Jean Luc Picard", "make.it.so@starfleet.org", "272-436-5649", 50000.00)
    employee_3 = Employee.new("Benjamin Sisko", "space.baller@starfleet.org", "999-999-9999", 80000.00)
    employee_4 = Employee.new("James T. Kirk", "beam.me.up@starfleet.org", "272-436-8912", 55000.00)

    employee_1.review=("Spock is a very positive person and encourages those around him, but he has not done well technically this year.  There are two areas in which Spock has room for improvement.  First, when communicating verbally (and sometimes in writing), he has a tendency to use more words than are required.  This conversational style does put people at ease, which is valuable, but it often makes the meaning difficult to isolate, and can cause confusion. Second, when discussing new requirements with project managers, less of the information is retained by Spock long-term than is expected.  This has a few negative consequences: 1) time is spent developing features that are not useful and need to be re-run, 2) bugs are introduced in the code and not caught because the tests lack the same information, and 3) clients are told that certain features are complete when they are inadequate.  This communication limitation could be the fault of project management, but given that other developers appear to retain more information, this is worth discussing further.")
    employee_2.review=("Picard is a huge asset to SciMed and is a pleasure to work with.  He quickly knocks out tasks assigned to him, implements code that rarely needs to be revisited, and is always willing to help others despite his heavy workload.  When Picard leaves on vacation, everyone wishes he didn't have to go. Last year, the only concerns with Picard performance were around ownership.  In the past twelve months, he has successfully taken full ownership of both Acme and Bricks, Inc.  Aside from some false starts with estimates on Acme, clients are happy with his work and responsiveness, which is everything that his managers could ask for.")
    employee_3.review=("Thus far, there have been two concerns over Sisko's performance, and both have been discussed with her in internal meetings.  First, in some cases, Sisko takes longer to complete tasks than would normally be expected.  This most commonly manifests during development on existing applications, but can sometimes occur during development on new projects, often during tasks shared with Andrew.  In order to accommodate for these preferences, Sisko has been putting more time into fewer projects, which has gone well. Second, while in conversation, Sisko has a tendency to interrupt, talk over others, and increase her volume when in disagreement.  In client meetings, she also can dwell on potential issues even if the client or other attendees have clearly ruled the issue out, and can sometimes get off topic.")
    employee_4.review=("Kirk has been an incredibly consistent and effective developer.  Clients are always satisfied with her work, developers are impressed with her productivity, and she's more than willing to help others even when she has a substantial workload of her own.  She is a great asset to Awesome Company, and everyone enjoys working with her.  During the past year, she has largely been devoted to work with the Cement Company, and she is the perfect woman for the job.  We know that work on a single project can become monotonous, however, so over the next few months, we hope to spread some of the Cement Company work to others.  This will also allow Kirk to pair more with others and spread her effectiveness to other projects.")

    employee_1.rank=("Not Impressive")
    employee_2.rank=("Impressive")
    employee_3.rank=("Not Impressive")
    employee_4.rank=("Impressive")

    assert_equal "Not Impressive", employee_1.rank
    assert_equal "Impressive", employee_2.rank
    assert_equal "Not Impressive", employee_3.rank
    assert_equal "Impressive", employee_4.rank
    # ppc.hire(employee_2)
    # ppc.hire(employee_3)
    # ppc.hire(employee_4)
  end

  def test_can_give_raise_to_employee
    employee_2 = Employee.new("Jean Luc Picard", "make.it.so@starfleet.org", "272-436-5649", 50000.00)
    employee_2.review=("Picard is a huge asset to SciMed and is a pleasure to work with.  He quickly knocks out tasks assigned to him, implements code that rarely needs to be revisited, and is always willing to help others despite his heavy workload.  When Picard leaves on vacation, everyone wishes he didn't have to go. Last year, the only concerns with Picard performance were around ownership.  In the past twelve months, he has successfully taken full ownership of both Acme and Bricks, Inc.  Aside from some false starts with estimates on Acme, clients are happy with his work and responsiveness, which is everything that his managers could ask for.")
    employee_2.rank=("Impressive")
    assert_equal "Impressive", employee_2.rank
    employee_2.mo_money!(5000.00)
    assert_in_delta 55000.00, employee_2.salary, 0.01
  end

  def test_can_give_raise_to_department
    ppc = Department.new("Party Planning Committee")
    employee_1 = Employee.new("Schn Tgai Spock", "it.is.complicated@starfleet.org", "266-354-2833", 60000.00)
    employee_2 = Employee.new("Jean Luc Picard", "make.it.so@starfleet.org", "272-436-5649", 50000.00)
    employee_3 = Employee.new("Benjamin Sisko", "space.baller@starfleet.org", "999-999-9999", 80000.00)
    employee_4 = Employee.new("James T. Kirk", "beam.me.up@starfleet.org", "272-436-8912", 55000.00)

    # employee_1.review=("Spock is a very positive person and encourages those around him, but he has not done well technically this year.  There are two areas in which Spock has room for improvement.  First, when communicating verbally (and sometimes in writing), he has a tendency to use more words than are required.  This conversational style does put people at ease, which is valuable, but it often makes the meaning difficult to isolate, and can cause confusion. Second, when discussing new requirements with project managers, less of the information is retained by Spock long-term than is expected.  This has a few negative consequences: 1) time is spent developing features that are not useful and need to be re-run, 2) bugs are introduced in the code and not caught because the tests lack the same information, and 3) clients are told that certain features are complete when they are inadequate.  This communication limitation could be the fault of project management, but given that other developers appear to retain more information, this is worth discussing further.")
    # employee_2.review=("Picard is a huge asset to SciMed and is a pleasure to work with.  He quickly knocks out tasks assigned to him, implements code that rarely needs to be revisited, and is always willing to help others despite his heavy workload.  When Picard leaves on vacation, everyone wishes he didn't have to go. Last year, the only concerns with Picard performance were around ownership.  In the past twelve months, he has successfully taken full ownership of both Acme and Bricks, Inc.  Aside from some false starts with estimates on Acme, clients are happy with his work and responsiveness, which is everything that his managers could ask for.")
    # employee_3.review=("Thus far, there have been two concerns over Sisko's performance, and both have been discussed with her in internal meetings.  First, in some cases, Sisko takes longer to complete tasks than would normally be expected.  This most commonly manifests during development on existing applications, but can sometimes occur during development on new projects, often during tasks shared with Andrew.  In order to accommodate for these preferences, Sisko has been putting more time into fewer projects, which has gone well. Second, while in conversation, Sisko has a tendency to interrupt, talk over others, and increase her volume when in disagreement.  In client meetings, she also can dwell on potential issues even if the client or other attendees have clearly ruled the issue out, and can sometimes get off topic.")
    # employee_4.review=("Kirk has been an incredibly consistent and effective developer.  Clients are always satisfied with her work, developers are impressed with her productivity, and she's more than willing to help others even when she has a substantial workload of her own.  She is a great asset to Awesome Company, and everyone enjoys working with her.  During the past year, she has largely been devoted to work with the Cement Company, and she is the perfect woman for the job.  We know that work on a single project can become monotonous, however, so over the next few months, we hope to spread some of the Cement Company work to others.  This will also allow Kirk to pair more with others and spread her effectiveness to other projects.")

    employee_1.rank=("Not Impressive")
    employee_2.rank=("Impressive")
    employee_3.rank=("Not Impressive")
    employee_4.rank=("Impressive")

    ppc.hire(employee_1)
    ppc.hire(employee_2)
    ppc.hire(employee_3)
    ppc.hire(employee_4)

    assert_equal "Not Impressive", employee_1.rank
    assert_equal "Impressive", employee_2.rank
    assert_equal "Not Impressive", employee_3.rank
    assert_equal "Impressive", employee_4.rank
    ppc.thresh!
    ppc.level_up!(10000.00)
    assert_equal 255000.00, ppc.total_salary?
  end

end

# ((asset))|((effective))|((impress))|((pleasure))
# \basset|effective|impress|pleasure\b



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
