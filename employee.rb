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
    # good_words = (/\binspire|patient|great|accomplish|talent|potential|promotion\b/i)
    # bad_words = (/\bconcern|fail|leave|better|emotional|distracted|confrontation|disagreement|problem|lack|dmeote\b/i)
    if @review.match(/\binspire|great|accomplish|talent|promotion\b/i)
      @rank = true
    elsif @review.match(/\bconcern|fail|emotional|distract|problem|demote\b/i)
      @rank = false
    end
  end

  def mo_money!(money)
    if @rank == "Impressive"
      @salary = (@salary + money)
    # else
    #   puts "I am not impressed. No raise for you!"
    end
  end

end
