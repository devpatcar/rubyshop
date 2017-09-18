require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  fixtures :products
  test "product attributes must not be empty" do 
    product = Product.new    
    assert product.errors[:name] 
    assert product.errors[:description]
    assert product.errors[:price]
    assert product.errors[:image] 
  end 

  test "product price must be positive" do 
    product = Product.new(name: "My Book Title", 
    description: "yyy", 
    image: "http://mikemoir.com/mikemoir/wp-content/uploads/2015/06/MedRes_Product-presentation-2.jpg") 
    
    product.price = -1 
    assert product.invalid? 
    assert_equal ["must be greater than or equal to 0.01"], 
    product.errors[:price] 

    product.price = 0 
    assert product.invalid? 
    assert_equal ["must be greater than or equal to 0.01"], 
    product.errors[:price]

    product.price = 1 
    assert product.valid? 
  end
  
  def new_product(image) 
    Product.new(name: "My Book Title",
     description: "yyy",
      price: 1, image: image) 
  end 
  
  test "image url" do 
    ok = %w{ fred.gif fred.jpg fred.png FRED.JPG FRED.Jpg
     http://a.b.c/x/y/z/fred.gif } 
    bad = %w{ fred.doc fred.gif/more fred.gif.more } 
    
    ok.each do |name|    
    assert new_product(name).valid?, "#{name} shouldn't be invalid" 
  end 
  bad.each do |name| 
    assert new_product(name).invalid?, "#{name} shouldn't be valid" 
  end 
end 
end
