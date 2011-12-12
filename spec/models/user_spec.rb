require 'spec_helper'

describe User do

  it "Can't be saved without a user name" do
    user = FactoryGirl.build(:user)
    user.name = nil
    user.valid?.should == false
  end

end
