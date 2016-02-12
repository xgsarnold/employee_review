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
    @roster.each do |i|
      if i.rank == "Impressive"
        @the_worthy << i
      end
    end
  end

  def level_up!(money)
    individual_money = money / @the_worthy.count
    @roster.each {|e| e.mo_money!(individual_money)}
    end
  end
