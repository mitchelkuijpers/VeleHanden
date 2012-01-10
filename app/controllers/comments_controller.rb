class CommentsController < ApplicationController

  before_filter :authenticate_user!

  # Create a new comment on a commentable
  def create
    klass = Commentable.getInstance params[:commentable_type]
    commentable = klass.find params[:commentable_id]

    comment = Comment.new(params[:comment])
    comment.created_by = current_user
    comment.commentable = commentable

    if comment.valid? && comment.save
      # Redirect to the commentable
      redirect_to polymorphic_path commentable
    end

  end

end
