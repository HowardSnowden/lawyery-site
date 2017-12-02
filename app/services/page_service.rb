class PageNotFound < StandardError; end 
class PageService
    attr_accessor :page, :render
	def initialize(page_name, **params)
      @page = Page.where('lower(title) = ?', page_name.downcase).first
      if !@page
      	raise PageNotFound
      end
      @render =  set_render

	end
  
   

   def get_content(type)
     content = @page.contents.where(title: type).first || OpenStruct.new
     yield content if block_given?
     content
   end

   def main_content_format
     result = get_content('main') do |c|
      c.body = c.body.split(' ').map{|m| "<b>#{m}</b>"}.join(' ')
     end
      result.body.html_safe
   end
    
    private 

    def set_render
      @page.title.downcase
    end
end