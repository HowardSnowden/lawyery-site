class Content < ApplicationRecord
	belongs_to :page 
  include ActionView::Helpers 
  before_save :remove_image_if_blank


  def section_image_enum
    image_path = Rails.root.to_s + "/app/assets/images"
    Dir.entries(image_path).select{|v| v =~ /.*\.(jpeg|png|jpg|gif)/ }.map{|v| [v, v]}
  end

  def formatted_body(tag)
    html = ""
    body.split(/\n/).each do |b|
      html << content_tag(tag.to_sym, b)
    end
    html.html_safe
  end
  
  def formatted_list_items
    html = ""
    if self.list_items 
      self.list_items.split(/\n/).each do |item|
        html << content_tag(:li, item)

      end
    end
    html.html_safe
  end

  private 

  def remove_image_if_blank
    if self.section_image.blank? 
      self.section_image = nil 
    end
  end


  
end
