require File.dirname(__FILE__) + "/spec_helper"

describe 'boot' do
  include Rack::Test::Methods

  describe "test routes" do

    it 'should respond to /' do
      get '/'
      last_response.should be_ok
    end

  end
end
