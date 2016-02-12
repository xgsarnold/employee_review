class Employee
  attr_reader :name, :salary
  attr_accessor :review
  def initialize(name, email, phone, salary)
    @name = name
    @email = email
    @phone = phone
    @salary = salary
    @review = ""
  end



end
