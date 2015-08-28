class ChangeColumnToOhaka < ActiveRecord::Migration
  def change
    change_column :ohakas, :senko_num, :integer, default: 0
    change_column :ohakas, :orin_num, :integer, default: 0
  end
end
