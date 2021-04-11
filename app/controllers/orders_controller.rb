class OrdersController < ApplicationController
  before_action :authenticate_user!
  def index
    @order = Order.all
  end

  def new
    @order = Order.new
    @product = Product.find(session[:current_product])
  end

  def create
    @order = Order.new
    @order.ordered = current_user
    @order.attended_order_id = session[:current_product]
    if @order.save
      flash[:success] = "#{current_user.name} ordered this Product!"
      redirect_to @order
    else
      flash[:danger] = 'Something went wrong'

      render 'new'
    end
  end

  def show
    @order = Order.find(params[:id])
  end

  private

  def order_params
    params.permit(:ordered_id, :attended_order_id)
  end
end
