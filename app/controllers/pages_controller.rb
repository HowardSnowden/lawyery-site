class PagesController < ApplicationController
    

    def index
    	@page = PageService.new('index')

    end
	
	def show
	   begin 	
		@page = PageService.new(params[:page_name])
		render @page.render
	   rescue PageNotFound, ActionView::MissingTemplate => e
	   	 flash[:error] = "That page could not be found"
	   	 redirect_to root_url
	   end
	end

	
end
