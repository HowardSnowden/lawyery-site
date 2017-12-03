class Page < ApplicationRecord
	include FileUtils
	has_many :contents 
	validates_presence_of :title
	validates_uniqueness_of :title
	after_create :create_page_template, unless: :is_index?
	after_destroy :remove_page_template, unless: :is_index?

	rails_admin do 
		field :title
		field :layout_type
		field :contents
		field :meta_description
		field :meta_title
	end


	def is_index?
		title.downcase == 'index'
	end

	private 

	def create_page_template
	  path = File.expand_path("../../views/pages", __FILE__)
	  FileUtils.cp("#{path}/index.html.erb", "#{path}/#{title.downcase}.html.erb")
	end

	def remove_page_template
		path = File.expand_path("../../views/pages", __FILE__)
		file = "#{path}/#{title.downcase}.html.erb"
		FileUtils.rm(file) if File.exists?(file)

	end



end
