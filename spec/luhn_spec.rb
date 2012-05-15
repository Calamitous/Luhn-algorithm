require File.dirname(__FILE__) + '/../luhn'


describe Luhn do
  context 'with a valid value' do
    it 'should be valid' do
      # Sample ID pulled from http://en.wikipedia.org/wiki/Luhn_algorithm
      Luhn.new('79927398713').should be_valid
    end

    it 'when an integer value is provided' do
      Luhn.new(79927398713).should be_valid
    end

    it 'when a short value is provided' do
      Luhn.new('18').should be_valid
    end
  end

  context 'with an invalid value' do
    context 'when an incorrect check digit is provided' do
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

    context 'when an empty value is provided' do
      it 'should raise an error' do
        lambda { Luhn.new('') }.should raise_error('ID number must be at least two characters long')
      end
    end

    context 'when an value with letters is provided' do
      it 'should raise an error' do
        lambda { Luhn.new('12a345') }.should raise_error('ID number should not contain letters')
      end
    end
  end
end
