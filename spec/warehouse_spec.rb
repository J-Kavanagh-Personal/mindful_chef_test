# frozen_string_literal: true

require 'rspec'
require_relative '../lib/warehouse'

RSpec.describe Warehouse do
  subject { described_class.new(max_dimensions: max_dimensions) }

  let(:max_dimensions) { [10, 10] }
  let(:current_position) { Position.new(0,0) }

  context '#update_grid' do
    it 'returns new position when the direction are within the grid' do
      expect((subject.update_grid(1,0, current_position)).x).to equal(1)
    end

    it 'returns current position when the direction are outside the grid' do
      expect((subject.update_grid(0,0, current_position)).x).to equal(0)
    end

    it 'returns nil when the direction is not along the axis' do
      expect((subject.update_grid(-1,2, current_position))).to equal(nil)
    end
  end
end
