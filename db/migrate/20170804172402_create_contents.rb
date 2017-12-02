class CreateContents < ActiveRecord::Migration[5.0]
  def change
    create_table :contents do |t|
      t.string :title
      t.string :header
      t.string :sub_header
      t.text :body 
      t.integer :layout_type
      t.timestamps
    end
  end
end
