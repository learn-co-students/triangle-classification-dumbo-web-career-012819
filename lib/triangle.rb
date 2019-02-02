require 'pry'
require 'rb-readline'

class Triangle
  # write code here
  attr_accessor :side1, :side2, :side3, :sides

  def initialize(side1, side2, side3)
    @side1 = side1
    @side2 = side2
    @side3 = side3

    @sides = [side1, side2, side3]
  end

  def kind
    clean
    if self.side1 == self.side2 && self.side2 == self.side3
      :equilateral
    elsif self.side1 == self.side2 || self.side2 == self.side3 || self.side1 == self.side3
      :isosceles
    else
      :scalene
    end

  end


  def clean
    if self.sides.include?(0)
      raise TriangleError
    end

    combination_of_sides = self.sides.combination(2).to_a

    combination_of_sides.each do |sides|
      sum = sides[0] + sides[1]
      if sum <= self.sides.max
        raise TriangleError
      end
    end
  end

  class TriangleError < StandardError

  end
end
