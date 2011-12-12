require 'spec_helper'

describe CommentsController do

  describe "PUT 'create'" do
    it "returns http success" do
      user = mock_model(User)
      User.should_receive(:find).with("123").and_return(user)
      put 'create', {commentable_type: :User, commentable_id: "123", comment: "This is pretty cool"}

      response.should be_success
    end
  end

end
