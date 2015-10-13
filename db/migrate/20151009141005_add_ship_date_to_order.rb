class AddShipDateToOrder < ActiveRecord::Migration
  def change
    add_column :orders, :ship_date, :timestamp, null: true
  end
end
