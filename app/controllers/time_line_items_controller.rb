class TimeLineItemsController < ApplicationController

  def new
    @time_line_item = TimeLineItem.new
    @page = Page.find params[:page_id]
  end

  def create
    @time_line_item = TimeLineItem.new params[:time_line_item]
    page = Page.find params[:page_id]
    @time_line_item.page_id = page.id

    respond_to do |format|
      if @time_line_item.valid? && @time_line_item.save
          format.html  { redirect_to(page, notice: "Gebeurtenis succesvol toegevoegd.") }
      else
          format.html  { render({action: :new}, alert: "Er waren validatie fouten.") }
      end
    end
  end

end