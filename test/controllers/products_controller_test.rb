require 'test_helper'

class ProductsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @product = products(:book)
    @update = {
       title: 'Lorem Ipsum',
       description: 'Wibbles are fun!',
       image: 'http://mikemoir.com/mikemoir/wp-content/uploads/2015/06/MedRes_Product-presentation-2.jpg',
       price: 19.95
      } 
  end

  test "should get index" do
    get products_url
    assert_response :success
  end

  test "should get new" do
    get new_product_url
    assert_response :success
  end

  test "should create product" do    
    post products_url, params: { product: @update }    
    assert_response :success
  end

  test "should show product" do
    get product_url(@product)
    assert_response :success
  end

  test "should get edit" do
    get edit_product_url(@product)
    assert_response :success
  end

  test "should update product" do
    patch product_url(@product), params: { product: @update }
    assert_response :success
  end

  test "can't delete product in cart" do
    assert_difference('Product.count', 0) do
      delete product_url(products(:two))
    end      
    assert_redirected_to '/admin/products'
  end

  test "should destroy product" do    
    delete product_url(@product) 
    assert_redirected_to '/admin/products'
  end
end
