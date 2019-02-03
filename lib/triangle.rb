require "pry"
class Triangle
  # write code here
  def initialize(side_1, side_2, side_3)
    @side_1 = side_1
    @side_2 = side_2
    @side_3 = side_3
  end

  def valid?
    #check valid values
    if @side_1 <= 0 || @side_1 <= 0 || @side_3 <= 0
      raise TriangleError
    # check if the triangle violates ** triangle inequality **
    elsif @side_1 + @side_2 > @side_3 && @side_2 + @side_3 > @side_1 && @side_1 + @side_3 > @side_2
      true
    else
      raise TriangleError
    end
  end

  def kind
    if self.valid?
      if @side_1 == @side_2 && @side_1 == @side_3
        :equilateral
      elsif @side_1 == @side_2 || @side_1 == @side_3 || @side_2 == @side_3
        :isosceles
      else
        :scalene
      end
    end
  end

  class TriangleError < StandardError
  end

end
