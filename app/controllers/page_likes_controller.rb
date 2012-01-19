class PageLikesController < ApplicationController

  before_filter :authenticate_user!

  def create
    PageLike.create! page_id: params[:page_id], user_id: current_user.id
    Page.incrementLikes(params[:page_id])
    respond_to do |format|
      format.json  { render json: {}, status: :ok }
    end
  end

end