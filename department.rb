require './employee.rb'

class Department
  attr_reader :name, :roster
  def initialize(name)
    @name = name
    @roster = []
  end

  def hire(employee)
    @roster << employee
  end


end
