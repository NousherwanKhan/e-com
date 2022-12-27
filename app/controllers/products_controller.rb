class ProductsController < ApplicationController

  before_action :authenticate_user!
  before_action :admin_access

  def index
    @products = Product.all
  end

  def show
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to(:action => 'index')
    else
      render(:action => 'new')
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      redirect_to(:action => 'index')
    else
      render('edit')
    end
  end

  def destroy
    @product.Product.find(params[:id]).destroy
  end

  private
    
    def product_params
      params.require(:product).permit(:name, :price, :image)
    end
end
