class PagePhotosController < ApplicationController

  before_filter :authenticate_user!

  def new
    @page_photo = PagePhoto.new
    @page = Page.find params[:page_id]
  end

  def create
    @page_photo = PagePhoto.new params[:page_photo]
    page = Page.find params[:page_id]
    @page_photo.page_id = page.id

    respond_to do |format|
      if @page_photo.valid? && @page_photo.save
          format.html  { redirect_to(page, notice: "Foto succesvol toegevoegd.") }
          format.json  { render json: {}, status: :ok }
      else
          format.html  { render({action: :new}, alert: "Er waren validatie fouten.") }
          format.json  { render json: @page_photo.errors, status: :unprocessable_entity }
      end
    end
  end

end