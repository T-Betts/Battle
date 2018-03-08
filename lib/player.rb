require_relative './game.rb'

class Player
  attr_reader :name, :hit_points
  HP_DEFAULT = 100
  def initialize(name, hit_points = HP_DEFAULT)
    @name = name
    @hit_points = hit_points
  end

  def receive_damage
    @hit_points -= 10
  end
end
