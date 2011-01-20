require File.dirname(__FILE__) + "/../spec_helper"

describe Calculator do

  subject { Calculator.new }

  it 'should return all areas' do
   subject.should have_key('banheiro')
  end
  
  it 'return should be a hash' do
    subject.select('banheiro').should be_an_instance_of(Hash)
  end

end
