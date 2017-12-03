class AddOrderToContent < ActiveRecord::Migration[5.0]
  def change
    add_column :contents, :order, :integer
  end
end
