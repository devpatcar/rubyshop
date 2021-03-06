class ProductsController < ApplicationController
  layout "admin", except: [:show]
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  include CurrentCart
  before_action :set_cart
  # GET /products
  # GET /products.json
  def index   
    @products = Product.all
  end

  # GET /products/1
  # GET /products/1.json
  def show
  end

  # GET /products/new
  def new
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products
  # POST /products.json
  def create
    @product = Product.new(product_params)
    
    respond_to do |format|
      if @product.save
        @products = Product.all
        format.html { render :index, notice: 'Product was successfully created.' }
        format.json { render :index, status: :created, location: @products }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    @products = Product.all
    respond_to do |format|
      if @product.update(product_params)
        format.html { render :index, notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: @products }
        
        @products = Product.all
        ActionCable.server.broadcast 'products',
        html: render_to_string('store/index', layout: false)
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to "/admin/products", notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def who_bought 
    @product = Product.find(params[:id]) 
    @latest_order = @product.orders.order(:updated_at).last 
    if stale?(@latest_order) 
      respond_to do |format| 
        format.atom 
      end
    end
  end
   
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:name, :description, :image, :price, :stock)
    end
end
