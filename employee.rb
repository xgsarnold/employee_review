class Employee
  attr_reader :name, :salary, :keywords
  attr_accessor :review, :rank
  def initialize(name: "", email: "", phone: "", salary: 50000)
    @name = name
    @email = email
    @phone = phone
    @salary = salary
    @review = ""
    @rank = false
  end

  def rank!
    if @review.match(/\binspire|great|accomplish|talent|promotion\b/i)
      @rank = true
    elsif @review.match(/\bconcern|fail|emotional|distract|problem|demote\b/i)
      @rank = false
    end
  end

  def mo_money!(money)
    if @rank == "Impressive"
      @salary = (@salary + money)
    end
  end

end
