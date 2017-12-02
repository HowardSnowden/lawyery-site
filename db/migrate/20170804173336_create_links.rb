class CreateLinks < ActiveRecord::Migration[5.0]
  def change
    create_table :links do |t|
      t.string :display
      t.string :location
      t.text :classes, array: true, default: []
      t.timestamps
    end
  end
end
