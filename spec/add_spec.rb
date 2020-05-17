# ./spec/add_spec.rb
require './lib/add.rb'

RSpec.describe Addition do
  let(:num) { Addition.new }
  describe '#initialize' do
    it 'initializes with a num variable assigned a value 0' do
      expect(num.result).to eql(0)
    end
  end

  describe '#add' do
    it 'adds the user input to the variable num' do
      num.add(15)
      expect(num.result).to eql(15)
    end
  end

  describe '#result' do
    it 'returns the result of the sum' do
      num.add(9)
      expect(num.result).to eql(9)
    end
  end
end
