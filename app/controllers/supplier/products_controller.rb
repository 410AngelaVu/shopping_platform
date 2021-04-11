class Supplier::ProductsController < ApplicationController
  before_action :set_product, only: %i[show edit update destroy]
  before_action :check_if_supplier

  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def edit; end

  def show
    @product = Product.find params[:id]
    session[:current_product] = @product.id
  end

  def create
    @product = current_user.created_products.build(product_params)
    if @product.save
      flash[:notice] = 'The product was created succesfully.'
      redirect_to @product
    else

      render 'new'
    end
  end

  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: 'Product is successfully updated.' }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: 'Product was successfully destroyed' }
      format.json { head :no_content }
    end
  end

  private

  def check_if_supplier
    redirect_to root_path unless current_user.is_supplier?
  end

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:name, :description, :price, :quantity, :supplier_id)
  end
end
