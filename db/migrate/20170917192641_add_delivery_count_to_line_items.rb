class AddDeliveryCountToLineItems < ActiveRecord::Migration[5.1]
  def change
    add_column :line_items, :deliveryCount, :integer
  end
end
