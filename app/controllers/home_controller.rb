class HomeController < ApplicationController
  def index
    @best = @pages = Page.all.desc(:likes)
  end

end
