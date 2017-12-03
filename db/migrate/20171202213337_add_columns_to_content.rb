class AddColumnsToContent < ActiveRecord::Migration[5.0]
  def change
    add_column :contents, :more_details_link, :string 
    add_column :contents, :section_image, :string 
    add_column :contents, :list_items, :text 
    add_column :pages, :should_show_banner, :boolean
  end
end
