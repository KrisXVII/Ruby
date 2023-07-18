module Lets_go
  def lets_go
    return "Ok lets go"
  end
end

class Vehicle
  include Lets_go
  attr_accessor :price, :color

  def initialize(price, color)
    @price = price
    @color = color.downcase
  end

  def to_s
    return "This #{color} vehicle is prized #{price} €"
  end
end

module Info
  def usage
    if self.color == 'red'
      return "I am a sports car!"
    else
      return "Better go to job with this car"
    end
  end

  def label_find
    return self.label
  end
end

class Car < Vehicle
  include Info
  attr_accessor :label, :type, :tires

  def initialize(type, label, price, color)
    super(price, color)
    @tires = 4
    @type = type
    @label = label
  end

  def to_s
    return super + ", it's a #{type} by #{label}, #{tires} tires."
  end
end

car1 = Car.new('car', 'BMW', 10_000, 'Red')
print car1, "\n",
      Car.ancestors,"\n",
      Vehicle.ancestors,"\n",
      car1.label_find, "\n"
vehicle1 = Vehicle.new(5_720, 'white')
print vehicle1


