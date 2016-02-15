require 'minitest/autorun'
require 'minitest/pride'
require 'byebug'
require './department.rb'

class EmployeeReviewsTest < Minitest::Test
  def test_can_create_new_department
    department = Department.new("Party Planning Committee")
    assert Department
    assert_equal Department, department.class
  end

  def test_can_create_new_employees
    employee = Employee.new(name: "Augustine", email: "hungry.hippo@gmail.com", phone: "919-477-8253", salary: 77777.00)
    assert Employee
    assert_equal Employee, employee.class
  end

  def test_can_add_employ_to_department
    ppc = Department.new("Party Planning Committee")
    employee = Employee.new(name: "Jean Luc Picard", email: "make.it.so@starfleet.org", phone: "272-436-5649", salary: 50000.00)
    ppc.hire(employee)
    assert ppc.roster.include?(employee)
  end

  def test_can_get_employee_name
    ppc = Department.new("Party Planning Committee")
    employee = Employee.new(name: "Jean Luc Picard", email: "make.it.so@starfleet.org", phone: "272-436-5649", salary: 50000.00)
    ppc.hire(employee)
    assert_equal "Jean Luc Picard", ppc.roster[0].name
  end

  def test_can_get_employee_salary
    ppc = Department.new("Party Planning Committee")
    employee = Employee.new(name: "Jean Luc Picard", email: "make.it.so@starfleet.org", phone: "272-436-5649", salary: 50000.00)
    ppc.hire(employee)
    assert_equal 50000.00, ppc.roster[0].salary
  end

  def test_can_get_department_name
    ppc = Department.new("Party Planning Committee")
    assert_equal "Party Planning Committee", ppc.name
  end

  def test_can_get_total_salary_of_department
    ppc = Department.new("Party Planning Committee")
    employee_1 = Employee.new(name: "Jean Luc Picard", email: "make.it.so@starfleet.org", phone: "272-436-5649", salary: 50000.00)
    employee_2 = Employee.new(name: "James T. Kirk", email: "beam.me.up@starfleet.org", phone: "272-436-8912", salary: 55000.00)
    employee_3 = Employee.new(name: "Schn Tgai Spock", email: "live.long@starfleet.org", phone: "266-354-2833", salary: 60000.00)
    ppc.hire(employee_1)
    ppc.hire(employee_2)
    ppc.hire(employee_3)
    assert_equal 165000.00, ppc.total_salary?
  end

  def test_can_add_employee_review_text_to_employee
    employee = Employee.new(name: "Schn Tgai Spock", email: "live.long@starfleet.org", phone: "266-354-2833", salary: 60000.00)
    employee.review=("Spock is a very positive person and encourages those around him, but he has not done well technically this year.  There are two areas in which Spock has room for improvement.  First, when communicating verbally (and sometimes in writing), he has a tendency to use more words than are required.  This conversational style does put people at ease, which is valuable, but it often makes the meaning difficult to isolate, and can cause confusion. Second, when discussing new requirements with project managers, less of the information is retained by Spock long-term than is expected.  This has a few negative consequences: 1) time is spent developing features that are not useful and need to be re-run, 2) bugs are introduced in the code and not caught because the tests lack the same information, and 3) clients are told that certain features are complete when they are inadequate.  This communication limitation could be the fault of project management, but given that other developers appear to retain more information, this is worth discussing further.")
    assert_equal "Spock is a very positive person and encourages those around him, but he has not done well technically this year.  There are two areas in which Spock has room for improvement.  First, when communicating verbally (and sometimes in writing), he has a tendency to use more words than are required.  This conversational style does put people at ease, which is valuable, but it often makes the meaning difficult to isolate, and can cause confusion. Second, when discussing new requirements with project managers, less of the information is retained by Spock long-term than is expected.  This has a few negative consequences: 1) time is spent developing features that are not useful and need to be re-run, 2) bugs are introduced in the code and not caught because the tests lack the same information, and 3) clients are told that certain features are complete when they are inadequate.  This communication limitation could be the fault of project management, but given that other developers appear to retain more information, this is worth discussing further.", employee.review
  end

  def test_can_mark_whether_employee_performance_is_satisfactory_or_not
    employee_1 = Employee.new(name: "Schn Tgai Spock", email: "it.is.complicated@starfleet.org", phone: "266-354-2833", salary: 60000.00)
    employee_2 = Employee.new(name: "Jean Luc Picard", email: "make.it.so@starfleet.org", phone: "272-436-5649", salary: 50000.00)
    employee_3 = Employee.new(name: "Benjamin Sisko", email: "space.baller@starfleet.org", phone: "999-999-9999", salary: 80000.00)
    employee_4 = Employee.new(name: "James T. Kirk", email: "beam.me.up@starfleet.org", phone: "272-436-8912", salary: 55000.00)

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
    employee_2 = Employee.new(name: "Jean Luc Picard", email: "make.it.so@starfleet.org", phone: "272-436-5649", salary: 50000.00)
    employee_2.review=("Picard is a huge asset to SciMed and is a pleasure to work with.  He quickly knocks out tasks assigned to him, implements code that rarely needs to be revisited, and is always willing to help others despite his heavy workload.  When Picard leaves on vacation, everyone wishes he didn't have to go. Last year, the only concerns with Picard performance were around ownership.  In the past twelve months, he has successfully taken full ownership of both Acme and Bricks, Inc.  Aside from some false starts with estimates on Acme, clients are happy with his work and responsiveness, which is everything that his managers could ask for.")
    employee_2.rank=("Impressive")
    assert_equal "Impressive", employee_2.rank
    employee_2.mo_money!(5000.00)
    assert_in_delta 55000.00, employee_2.salary, 0.01
  end

  def test_can_give_raise_to_department
    ppc = Department.new("Party Planning Committee")
    employee_1 = Employee.new(name: "Schn Tgai Spock", email: "it.is.complicated@starfleet.org", phone: "266-354-2833", salary: 60000.00)
    employee_2 = Employee.new(name: "Jean Luc Picard", email: "make.it.so@starfleet.org", phone: "272-436-5649", salary: 50000.00)
    employee_3 = Employee.new(name: "Benjamin Sisko", email: "space.baller@starfleet.org", phone: "999-999-9999", salary: 80000.00)
    employee_4 = Employee.new(name: "James T. Kirk", email: "beam.me.up@starfleet.org", phone: "272-436-8912", salary: 55000.00)

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

  def test_can_give_raise_to_poorer_employees
    ppc = Department.new("Party Planning Committee")
    employee_1 = Employee.new(name: "Schn Tgai Spock", email: "it.is.complicated@starfleet.org", phone: "266-354-2833", salary: 60000.00)
    employee_2 = Employee.new(name: "Jean Luc Picard", email: "make.it.so@starfleet.org", phone: "272-436-5649", salary: 50000.00)
    employee_3 = Employee.new(name: "Benjamin Sisko", email: "space.baller@starfleet.org", phone: "999-999-9999", salary: 80000.00)
    employee_4 = Employee.new(name: "James T. Kirk", email: "beam.me.up@starfleet.org", phone: "272-436-8912", salary: 80000.00)

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

    ppc.thresh_with_block! {|employee| employee.salary < 80000.00 && employee.rank == "Impressive"}
    ppc.level_up_the_worthy!(10000.00)

    assert_equal 280000.00, ppc.total_salary?
    assert_equal 60000.00, employee_1.salary
    assert_equal 60000.00, employee_2.salary
    assert_equal 80000.00, employee_3.salary
    assert_equal 80000.00, employee_4.salary

  end

  def test_can_use_regex_to_determine_rank
    ppc = Department.new("Party Planning Committee")
    employee_1 = Employee.new(name: "Schn Tgai Spock", email: "it.is.complicated@starfleet.org", phone: "266-354-2833", salary: 60000.00)
    employee_2 = Employee.new(name: "Jean Luc Picard", email: "make.it.so@starfleet.org", phone: "272-436-5649", salary: 50000.00)
    employee_3 = Employee.new(name: "Benjamin Sisko", email: "space.baller@starfleet.org", phone: "999-999-9999", salary: 80000.00)
    employee_4 = Employee.new(name: "James T. Kirk", email: "beam.me.up@starfleet.org", phone: "272-436-8912", salary: 80000.00)

    employee_1.review=("Spock is easily distracted. He has a tendenacy to get emotional in confrontations and disagreements. He has technical abilities that would assist him in his work if he weren't so lazy. His poor work ethic leads him to failure in his tasks. His superiors have concern and frequently addressed these problems and given him repeated warnings. Unfortunately, he appears to lack any respect for authority. It is suggested that Spock be demoted or relocated to Starfleet to go through initial training once more.")
    employee_2.review=("Picard is one of the greatest captains Starfleet has ever seen. He demonstrates a strong and impressive ability to lead and inspire his subordinates. He is also patient with those who continue to learn the particulars of their duties. Picard surprises Starfleet with his ability to accomplish the most difficult tasks. Starfleet should watch Picard carefully and use his talent well. When the time comes, Starfleet should consider a promotion for Picard.")
    employee_3.review=("Sisko's relocation to Deep Space 9 was filled with hope, but also concern. In the past, Sisko demonstrated a strong capacity to lead others during his former command, but due to unfortunate circumstances Sisko found it difficult to continue to perform his duties as expected. Since his relocation, Sisko has failed to lead and govern in his new post as expected. Starfleet should continue to investigate the emotional state of Sisko and keep a close eye on his performance. His current state seems to distract him and cause problems. It may be necessary to demote in order to help him get better.")
    employee_4.review=("Kirk is unconventional, but he inspires. He returns impresive results. Our only worry in regard to his results thus far is his apparent struggle to form appropriate relationships with clients. Kirk demonstrates a strong ability to lead others and help them to accomplish their potential. It is our recommendation to seek the eventual promotion of Kirk among the Starfleet ranks to utilize his talent, particularly in the teaching of others.")

    employee_1.rank!
    employee_2.rank!
    employee_3.rank!
    employee_4.rank!

    assert_equal false,  employee_1.rank
    assert_equal true, employee_2.rank
    assert_equal false, employee_3.rank
    assert_equal true, employee_4.rank
  end
end

# ((asset))|((effective))|((impress))|((pleasure))
# \basset|effective|impress|pleasure\b



=begin

As part of this repository, you have a
file called sample_reviews.txt. This file
includes two negative employee reviews and
two positive employee reviews. Your task
is to write a method on the employee class
which looks the employee review text
stored in an employee instance variable
(in Part 1) and return a true or false for
whether this employee is performing
satisfactorily. This also means that you
will be removing the ability for users to
manually mark whether an employee is
performing satisfactorily. This will now
be determined by code.

Regular expressions will be your friend
here (and are required for this assignment,
even if you could do it without them).
Even so, this is not an easy problem. It
is in a category of problems called
"Natural Language Processing," and since
you are attempting to take reviews and
place them in one of two buckets
(satisfactory or not), it is known as a
"Classification" problem.

At this stage, your code should also:

Use at least one non-trivial regular
expression (i.e. Don't just look for a
literal string like /good/).

=end
