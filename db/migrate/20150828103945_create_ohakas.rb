class CreateOhakas < ActiveRecord::Migration
  def change
    create_table :ohakas do |t|
      t.string :name
      t.string :image
      t.string :location
      t.integer :senko_num
      t.integer :orin_num
      t.text :activity

      t.timestamps null: false
    end
  end
end
