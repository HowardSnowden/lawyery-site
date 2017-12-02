class AddPageIdToContent < ActiveRecord::Migration[5.0]
  def change
    add_column :contents, :page_id, :integer
  end
end
