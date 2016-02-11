require_relative "spec_helper"

describe User do

  before :each do 
    @user = User.new('joel')
  end

  describe '#initialize' do
    it "A user should have a name of type String" do
      expect(@user.name).to be_a(String)
    end

    # TODO: A name should be unique
  end

end