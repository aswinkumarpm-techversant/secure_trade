class HomesController < ApplicationController

  def index

  end
  def show
    @pages = Page.all
  end
end
