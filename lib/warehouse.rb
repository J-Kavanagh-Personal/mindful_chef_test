# frozen_string_literal: true

require_relative 'position'

# Warehouse handles the grid management that the robot uses to transition
class Warehouse

  def initialize(max_dimensions:)
    @max_x_dimensions = max_dimensions[0] - 1
    @max_y_dimensions = max_dimensions[1] - 1
    @grid = Array.new(max_dimensions[0]) { Array.new(max_dimensions[1], '.') }
  end

  def update_grid(x_direction, y_direction, current_position)
    return unless x_direction.zero? || y_direction.zero?

    new_position = Position.new((current_position.x + x_direction), (current_position.y + y_direction))

    if within_grid?(new_position)
      assign_space(new_position)
      empty_space(current_position) unless same_position?(current_position, new_position)
      new_position
    else
      current_position
    end
  end

  def print_grid
    max_y_dimensions.downto(0) do |y|
      grid_line = ''
      0.upto(max_x_dimensions) do |x|
        grid_line += grid[x][y].to_s + "(#{x}, #{y}) "
      end
      puts grid_line
    end
  end

  private

  attr_accessor :grid

  attr_reader :max_x_dimensions, :max_y_dimensions

  def within_grid?(position)
    return false if position.x > max_x_dimensions || position.x.negative?
    return false if position.y > max_y_dimensions || position.y.negative?

    true
  end

  def same_position?(current_position, new_position)
    current_position == new_position
  end

  def empty_space(current_position)
    grid[current_position.x][current_position.y] = '.'
  end

  def assign_space(new_position)
    grid[new_position.x][new_position.y] = 'R'
  end
end
