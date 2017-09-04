class ProductsChannel < ApplicationCable::Channel
  def self.broadcast(product)
    broadcast_to(product)    
    StoreController.render(root_path)
  end
  def subscribed   
    @products = Product.all
    stream_from @products.last
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
