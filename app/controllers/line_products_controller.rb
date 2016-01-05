class LineProductsController < ApplicationController
  before_action :set_line_product, only: [:show, :edit, :update, :destroy]

  # GET /line_products
  # GET /line_products.json
  def index
    @line_products = LineProduct.all
  end

  # GET /line_products/1
  # GET /line_products/1.json
  def show
  end

  # GET /line_products/new
  def new
    @line_product = LineProduct.new
  end

  # GET /line_products/1/edit
  def edit
  end

  # POST /line_products
  # POST /line_products.json
  def create
    @cart = current_cart
    product = Product.find(params[:product_id])
    # @line_product = @cart.line_products.build(product: product)
    @line_product = @cart.add_product(product.id)
    # @line_product = LineProduct.new(line_product_params)

    respond_to do |format|
      if @line_product.save
        format.html { redirect_to @line_product.cart, notice: 'Line product was successfully created.' }
        format.json { render :show, status: :created, location: @line_product }
      else
        format.html { render :new }
        format.json { render json: @line_product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /line_products/1
  # PATCH/PUT /line_products/1.json
  def update
    respond_to do |format|
      if @line_product.update(line_product_params)
        format.html { redirect_to @line_product, notice: 'Line product was successfully updated.' }
        format.json { render :show, status: :ok, location: @line_product }
      else
        format.html { render :edit }
        format.json { render json: @line_product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /line_products/1
  # DELETE /line_products/1.json
  def destroy
    @line_product.destroy
    respond_to do |format|
      format.html { redirect_to line_products_url, notice: 'Line product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_line_product
      @line_product = LineProduct.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def line_product_params
      params.require(:line_product).permit(:cart_id, :product_id)
    end
end
