require './employee.rb'

class Department
  attr_reader :name, :roster, :budget
  def initialize(name)
    @name = name
    @roster = []
    @budget = 0
    @the_worthy = []
  end

  def hire(employee)
    @roster << employee
  end

  def total_salary?
    @roster.reduce(0){|sum, i| sum + i.salary}
  end

  def thresh!
    @roster.each do |employee|
      if employee.rank == "Impressive"
        @the_worthy << employee
      end
    end
  end

  def thresh_with_block!
    @roster.each do |employee|
      if yield(employee)
        @the_worthy << employee
      end
    end
  end

  def level_up!(money)
    individual_money = money / @the_worthy.count
    @roster.each {|employee| employee.mo_money!(individual_money)}
  end

  def level_up_the_worthy!(money)
    individual_money = money / @the_worthy.count
    @the_worthy.each {|employee| employee.mo_money!(individual_money)}
  end
end
