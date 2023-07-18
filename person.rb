class Person

  def initialize(name, age, occupation)
    @name = name
    @age = age
    @occupation = occupation
  end

  def age_after_x_years(x)
    return @age + x
  end

  protected
  attr_reader :age

end

person1 = Person.new("Luca", 19, 'student')
print person1.age_after_x_years(4)
