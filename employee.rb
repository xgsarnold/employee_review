class Employee
  attr_reader :name, :salary
  attr_accessor :review, :rank
  def initialize(name, email, phone, salary)
    @name = name
    @email = email
    @phone = phone
    @salary = salary
    @review = ""
    @rank = ""
  end

  def mo_money!(money)
    if @rank == "Impressive"
      @salary = (@salary + money)
    # else
    #   puts "I am not impressed. No raise for you!"
    end
  end

end
