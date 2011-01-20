require File.dirname(__FILE__) + "/../spec_helper"

describe Calculator do

  subject { Calculator.new }

  it 'should return all areas' do
   subject.should have_key('banheiro')
  end
  
  it 'should return actual status of the area' do
    subject.select('banheiro').should be_an_instance_of(Hash)
  end

end
