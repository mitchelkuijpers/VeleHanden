# A child of the wiki al urls start with :
# /wikis/:id/pages
class PagesController < ApplicationController

  # /wikis/:id/pages
  def index
    @wiki = Wiki.find params[:wiki_id]
    @pages = @wiki.pages

    respond_to do |format|
      format.html  # index.html.haml
      format.json  { render :json => @pages }
    end
  end

  # /wikis/:id/pages/new
  def new
    @wiki = Wiki.find params[:wiki_id]
    @page = Page.new
    @page.wiki_id = @wiki.id

    respond_to do |format|
      format.html  # new.html.haml
    end
  end

  def show
    @page = Page.find params[:id]

    respond_to do |format|
      format.html  # show.html.haml
      format.json  { render :json => @page }
    end
  end

  def edit
    @page = Page.find params[:id]
    @wiki = @page.wiki

    respond_to do |format|
      format.html  # show.html.haml
      format.json  { render :json => @page }
    end
  end

  def create
    @page = Page.new(params[:page])
    @page.wiki_id = params[:wiki_id]

    respond_to do |format|
      if @page.valid? && @page.save
          format.html  { redirect_to({action: :index}, notice: "Pagina succesvol toegevoegd.") }
          format.json  { render json: {}, status: :ok }
      else
          format.html  { render({action: :new}, alert: "Er waren validatie fouten.") }
          format.json  { render json: @page.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @page = Page.find params[:id]

    respond_to do |format|
      if @page.update_attributes params[:page]
        format.html { redirect_to [@page.wiki, @page], notice: "Aanpassing was succesvol" }
        format.json { render json: {}, status: :ok}
      else
        format.html { render({action: :edit}, alert: "Er waren validatie fouten.") }
        format.json { render json: @page.errors, status: :unprocessable_entity}
      end
    end
  end

  def destroy
    page = Page.find params[:id]
    page.destroy
    respond_to do |format|
      format.html { redirect_to(wiki_pages_path(params[:wiki_id]), notice: "Pagina succesvol verwijderd") }
      format.json { render json: {}, status: :ok}
    end
  end

end