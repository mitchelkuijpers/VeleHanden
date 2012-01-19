require 'spec_helper'

# Specs in this file have access to a helper object that includes
# the HomeHelper. For example:
#
# describe HomeHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       helper.concat_strings("this","that").should == "this that"
#     end
#   end
# end
describe PagesHelper do
  pending "add some examples to (or delete) #{__FILE__}"

  describe "divides arrays is modulo 4" do
     it "divides an array of 8 in 2" do
       result = PagesHelper.createArrayOfFour([1,2,3,4,5,6,7,8])
       result.size.should eq(2)
       result[0].size.should eq(4)
       result[1].size.should eq(4)
     end
   end
end