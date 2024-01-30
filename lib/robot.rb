# frozen_string_literal: true

require_relative 'warehouse'
require_relative 'position'

# The Robot is the agent which traverses the grid stored in the warehouse
class Robot

  attr_reader :warehouse, :starting_position
  attr_accessor :current_position

  def initialize(starting_position:, warehouse:)
    @starting_position = starting_position
    @current_position = Position.new(starting_position[0], starting_position[1])
    @warehouse = warehouse
    warehouse.update_grid(0, 0, current_position)
    warehouse.print_grid
  end

  def command_sequence(commands)
    return if commands.nil?

    commands.split(',').each { |command| single_command(command: command) }
    true
  end

  private

  def single_command(command:)
    return if command.nil?

    puts command
    move(compass_direction: command)
    warehouse.print_grid
  end

  def move(compass_direction:)
    return nil unless %w[N S E W].include? compass_direction

    @current_position = move_in_compass_direction(compass_direction: compass_direction)
  end

  def move_in_compass_direction(compass_direction:)
    case compass_direction
    when 'N'
      warehouse.update_grid(0, 1, current_position)
    when 'S'
      warehouse.update_grid(0, -1, current_position)
    when 'E'
      warehouse.update_grid(1, 0, current_position)
    when 'W'
      warehouse.update_grid(-1, 0, current_position)
    end
  end
end
