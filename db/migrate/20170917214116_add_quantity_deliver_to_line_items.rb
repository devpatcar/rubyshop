class AddQuantityDeliverToLineItems < ActiveRecord::Migration[5.1]
  def change
    add_column :line_items, :quantity_deliver, :integer
  end
end
