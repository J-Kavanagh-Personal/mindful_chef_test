# frozen_string_literal: true

require 'rspec'

RSpec.describe Robot do
  subject { described_class.new(starting_position: starting_position, warehouse: warehouse) }

  let(:starting_position) { [0, 0] }
  let(:warehouse) { Warehouse.new(max_dimensions: [10, 10]) }

  context '#command_sequence' do
    it 'succeeds' do
      expect(subject.command_sequence('W,E')).to equal(true)
    end

    it 'fails when the commands is nil' do
      expect(subject.command_sequence(nil)).to equal(nil)
    end
  end
end
