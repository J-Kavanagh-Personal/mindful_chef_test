# frozen_string_literal: true

require_relative 'robot'

# Controller runs the and give robot the commands to move
class Controller

  attr_reader :warehouse, :robot

  def initialize(starting_position:, warehouse:)
    @robot = Robot.new(starting_position: starting_position, warehouse: warehouse)
  end

  def run(commands:)
    robot.command_sequence(commands)
  end
end
