class StaticPagesController < ApplicationController
  def home
    # Program.reindex
    # Enterprise.reindex

    @programs = Program.all.paginate(page: params[:page])
    puts params[:q][:enterprise_name] rescue nil
    if params[:q]
      @search = Program.search do
        any do
          with :enterprise_region_id, params[:q][:region_id] if params[:q][:region_id]
          fulltext params[:q][:enterprise_name], :fields => [:enterprise_name] if params[:q][:enterprise_name]
        end

        paginate :page => params[:page], :per_page => 6
      end
      @programs = @search.results
    end
  	
  	@feed_items = @programs
  end

  def faq
  end

  def about
  end

  def contact
  end

end
