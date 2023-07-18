class Vehicle
  attr_accessor :price, :color

  def initialize(price, color)
    @price = price
    self.color = color
  end

  def to_s
    return "This #{color} vehicle is prized #{price} €"
  end
end


class Car < Vehicle
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

car1 = Car.new('car', 'BMW', '10.000', 'red')
print "car1: ", car1, "\n"


