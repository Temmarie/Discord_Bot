# ./spec/add_spec.rb
require_relative '../lib/add.rb'

RSpec.describe Addition do
  let(:num) { Addition.new }
  describe '#initialize' do
    it 'initializes with a num variable assigned a value 0' do
      expect(num.result).to eql(0)
    end
  end

  describe '#add' do
    it 'adds the user_inputs and outputs the result' do
      num.add(12)
      expect(num.result).to eql(12)
    end
  end

  describe '#result' do
    it 'returns sum result' do
      num.age(10)
      expect(num.result).to eql(10)
    end
  end
end
