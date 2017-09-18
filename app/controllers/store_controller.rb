class StoreController < ApplicationController
    before_action :set_product, only: [:index]
    include CurrentCart
     before_action :set_cart     
    def index   
        @order = Order.new
        @allowPagination = false
        @isNotFirstPage = false
        @isNotLastPage = true  
        @pageCount = (Product.count / 10.to_f).ceil         
        @offset = (Integer(@page)*10)-10  
        @products = Product.limit(10).offset(@offset).order(:name)
        if  Integer(@page) == 1
            @isNotFirstPage = false  
            @isNotLastPage = true         
        end  
        if  Integer(@page) > 1
            @isNotFirstPage = true
            @isNotLastPage = true 
        end 
        if  Integer(@page) == Integer(@pageCount)
            @isNotFirstPage = true
            @isNotLastPage = false 
        end
        if  Product.count > 10
            @allowPagination = true          
        end  
        @firstPage = Integer(@page)-1
        @lastPage = Integer(@page)+1
    end   
   
    def set_product
      @page = params[:page]
      if @page == nil
          @page = 1
      end
    end 
end
