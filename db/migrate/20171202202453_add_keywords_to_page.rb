class AddKeywordsToPage < ActiveRecord::Migration[5.0]
  def change
    add_column :pages, :meta_description, :text
  end
end
