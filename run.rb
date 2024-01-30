# frozen_string_literal: true

require_relative 'lib/warehouse'
require_relative 'lib/controller'

warehouse = Warehouse.new(max_dimensions: [10, 10])

controller = Controller.new(starting_position: [0, 0], warehouse: warehouse)

controller.run(commands: 'N,E,N,E,N,E,N,E')

