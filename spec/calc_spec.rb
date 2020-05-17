# ./spec/calc_spec.rb
require './lib/calc.rb'

RSpec.describe Calculate do
  let(:present_year) { Calculate.new }
  describe '#initialize' do
    it 'initializes with a present_year variable assigned a value 2020' do
      expect(present_year.result).to eql(2020)
    end
  end

  describe '#age' do
    it 'subtracts the user age from the present year' do
      present_year.age(20)
      expect(present_year.result).to eql(2000)
    end
  end

  describe '#result' do
    it 'returns the birth_year result' do
      present_year.age(10)
      expect(present_year.result).to eql(2010)
    end
  end
end
