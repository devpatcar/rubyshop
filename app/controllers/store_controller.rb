class StoreController < ApplicationController
    #before_action :set_product, only: [:index]
    include CurrentCart
     before_action :set_cart
    def index      
        @products = Product.order(:name)
        #@allowPagination = false
        #@isNotFirstPage = false
        #@isNotLastPage = true  
        #@pageCount = (Product.count / 3.to_f).ceil         
        #@offset = (Integer(@page)*3)-3  
        #@products = Product.limit(3).offset(@offset)
        #if  Integer(@page) == 1
        #    @isNotFirstPage = false  
        #    @isNotLastPage = true         
        #end  
        #if  Integer(@page) > 1
        #    @isNotFirstPage = true
        #    @isNotLastPage = true 
        #end 
        #if  Integer(@page) == Integer(@pageCount)
        #    @isNotFirstPage = true
        #    @isNotLastPage = false 
        #end
        #if  Product.count > 4
        #    @allowPagination = true          
        #end  
        #@firstPage = Integer(@page)-1
        #@lastPage = Integer(@page)+1
      end   

  private
  # Use callbacks to share common setup or constraints between actions.
  #def set_product
    #@page = params[:page]
    #if @page == nil
    #    @page = 1
    #end
  #end

end
