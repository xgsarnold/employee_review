require './employee.rb'

class Department
  attr_reader :roster
  def initialize(name)
    @name = name
    @roster = []
  end

  def hire(employee)
    @roster << employee
  end


end
