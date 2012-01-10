class PageVideosController < ApplicationController

  before_filter :authenticate_user!

  def search_vimeo
    @page = params[:page_id]
    if(params[:q].nil?)
      respond_to do |format|
        format.html
      end
      return
    end

    @videos = PageVideo.search(params[:q], params[:page], 12)
    @videos = @videos["videos"]
    respond_to do |format|
      format.html  {
        @pagination = PageVideosHelper.create_pagination @videos
        @query = params[:q]
      }
      format.json  { render :json => @videos }
    end
  end

  def create
    @page_video = PageVideo.new params[:page_video]
    page = Page.find params[:page_id]
    @page_video.page_id = page.id

    respond_to do |format|
      if @page_video.valid? && @page_video.save
          format.html  { redirect_to(page, notice: "Video succesvol toegevoegd.") }
          format.json  { render json: {}, status: :ok }
      else
          format.html  { render({action: :new}, alert: "Er waren validatie fouten.") }
          format.json  { render json: @page_video.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy

  end
end