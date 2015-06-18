class StaticPagesController < ApplicationController
  def home
  	@programs = Program.all
  	@feed_items = @programs.paginate(page: params[:page])
  end

  def faq
  end

  def about
  end

  def contact
  end

end
