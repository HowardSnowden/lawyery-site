class AddLayoutTypeToPages < ActiveRecord::Migration[5.0]
  def change
    add_column :pages, :layout_type, :integer
  end
end
