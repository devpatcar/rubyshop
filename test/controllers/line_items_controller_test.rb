require 'test_helper'

class LineItemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @line_item = line_items(:one)
  end

  test "should get index" do
    get line_items_url
    assert_response :success
  end

  test "should get new" do
    get new_line_item_url
    assert_response :success
  end

  test "should create line_item" do
     assert_difference('LineItem.count') do
       post line_items_url, params: { product_id: products(:book).id }
       end        
       follow_redirect!   
  end

  test "should show line_item" do
    get line_item_url(@line_item)
    assert_response :success
  end
 
  test "should update line_item" do
    patch line_item_url(@line_item),
     params: { line_item: { product_id: @line_item.product_id } }
    assert_redirected_to '/admin/orders'
  end

  test "should destroy line_item" do
    assert_difference('LineItem.count', -1) do
      delete line_item_url(@line_item)
    end

    assert_redirected_to '/admin/orders'
  end
end
