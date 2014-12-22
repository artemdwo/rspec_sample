require 'rspec'
require File.dirname(__FILE__) + '/calc.rb'

describe 'CALC' do

  it 'should retrieve 0 if input is EMPTY string' do
    calc = CALC.new
    expect(calc.add('')).to eq 0
  end

  it 'should retrieve the same if input is one number' do
    calc = CALC.new
    expect(calc.add('1')).to eq 1
  end

  it 'should retrieve sum of two entered numbers' do
    calc = CALC.new
    expect(calc.add('1,2')).to eq 3
  end

  it 'should retrieve sum of 5 entered numbers' do
    calc = CALC.new
    expect(calc.add('1,2,3,4,5')).to eq 15
  end

  it 'should retrieve sum of 10 entered numbers' do
    calc = CALC.new
    expect(calc.add('1,2,3,4,5,6,7,8,9,10')).to eq 55
  end

  it 'should retrieve sum of entered numbers even if delimiter is "\n"' do
    calc = CALC.new
    expect(calc.add('1\n2,3')).to eq 6
  end

  it 'should retrieve the same entered numbers even if string contains "\n"' do
    calc = CALC.new
    expect(calc.add('1,\n')).to eq 1
  end

  it 'should retrieve sum of entered numbers even if delimiter is ";" and string contains "\n" or other rubbish' do
    calc = CALC.new
    expect(calc.add('//;\n1;2')).to eq 3
  end

  it 'should throw an exception if there is a negative value' do
    calc = CALC.new
    expect{calc.add('-1,2')}.to raise_error(RuntimeError)
  end

  it 'should throw an exception if there are negatives with values' do
    calc = CALC.new
    expect{calc.add('-1,-2,4,5,-3')}.to raise_error(RuntimeError, 'Negatives not allowed: -1,-2,-3')
  end

  it 'all values more than 1000 have to be ignored' do
    calc = CALC.new
    expect(calc.add('2,1001')).to eq 2
  end

end