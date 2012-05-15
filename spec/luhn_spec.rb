require File.dirname(__FILE__) + '/../luhn'


describe Luhn do
  context 'when a valid value is provided' do
    it 'should be valid' do
      # Sample ID pulled from http://en.wikipedia.org/wiki/Luhn_algorithm
      Luhn.new('79927398713').should be_valid
    end
  end

  context 'when an invalid value is provided' do
    it 'should not be valid' do
      Luhn.new('79927398710').should_not be_valid
      Luhn.new('79927398711').should_not be_valid
      Luhn.new('79927398712').should_not be_valid
      Luhn.new('79927398714').should_not be_valid
      Luhn.new('79927398715').should_not be_valid
      Luhn.new('79927398716').should_not be_valid
      Luhn.new('79927398717').should_not be_valid
      Luhn.new('79927398718').should_not be_valid
      Luhn.new('79927398719').should_not be_valid
    end
  end
end
