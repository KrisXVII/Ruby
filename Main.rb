module Move
  def move(length)
    print "I moved by #{length} units\n"
  end
end

class Car

  attr_accessor :label, :movement_unit, :series, :id
  @@number_of_cars=0

  def initialize(label, series)
    @@number_of_cars+=1
    @id = @@number_of_cars
    @label = label
    @movement_unit = 6
    @series = series
  end

  def get_movement_unit
    return @movement_unit
  end

  def move
    return "Car labeled '#{label}' #{series} moved by #{movement_unit} units\n"
  end

  def self.total_cars
    return @@number_of_cars
  end

  def info
    "
Car info:
 Label: #{self.label}
 Series: #{self.series}
 Moves: #{self.movement_unit}\n"
  end

  def to_s
    return "The car ID:#{id} from factory label #{label} series #{series} usually moves by #{movement_unit} units."
  end
end

car1 = Car.new('Mercedes', 'x1.3')
print car1.move
car1.label = 'BMW'
print car1.move
print car1.info
print Car.total_cars, "\n"
p car1
puts car1
