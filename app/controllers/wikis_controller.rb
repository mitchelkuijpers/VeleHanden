class WikisController < ApplicationController

  before_filter :authenticate_user!, except: [:overview, :index]

  def index
    @wikis = Wiki.all

    respond_to do |format|
      format.html  # index.html.haml
      format.json  { render :json => @wikis }
    end
  end

  def new
    @wiki = Wiki.new

    respond_to do |format|
      format.html  # new.html.haml
      format.json  { render :json => @wiki }
    end
  end

  def show
    @wiki = Wiki.find params[:id]

    respond_to do |format|
      format.html  # show.html.haml
      format.json  { render :json => @wiki }
    end
  end

  def edit
    @wiki = Wiki.find params[:id]

    respond_to do |format|
      format.html  # show.html.haml
      format.json  { render :json => @wiki }
    end
  end

  def create
    @wiki = Wiki.new(params[:wiki])
    respond_to do |format|
      if @wiki.valid? && @wiki.save
          format.html  { redirect_to({action: :index}, notice: "Wiki succesvol toegevoegd.") }
          format.json  { render json: {}, status: :ok }
      else
          format.html  { render({action: :new}, alert: "Er waren validatie fouten.") }
          format.json  { render json: @wiki.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @wiki = Wiki.find params[:id]

    respond_to do |format|
      if @wiki.update_attributes params[:wiki]
        format.html { redirect_to @wiki, notice: "Aanpassing was succesvol" }
        format.json { render json: {}, status: :ok}
      else
        format.html { render({action: :edit}, alert: "Er waren validatie fouten.") }
        format.json { render json: @wiki.errors, status: :unprocessable_entity}
      end
    end
  end

  def destroy
    wiki = Wiki.find params[:id]
    wiki.destroy
    respond_to do |format|
      format.html { redirect_to({action: :index}, notice: "Wiki succesvol verwijderd") }
      format.json { render json: {}, status: :ok}
    end
  end

end