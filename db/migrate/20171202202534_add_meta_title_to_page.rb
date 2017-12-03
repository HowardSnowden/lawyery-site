class AddMetaTitleToPage < ActiveRecord::Migration[5.0]
  def change
    add_column :pages, :meta_title, :string
  end
end
