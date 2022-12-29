class ProductsController < ApplicationController

  before_action :authenticate_user!, except: [:show]
  before_action :admin_access, except: [:show]
  before_action :find_category
  before_action :cart_count

  def index
    @products = @category.products.all
  end

  def show
    
    # @categories = Category.all
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new(:category_id => @category.id)

  end

  def create
    @product = Product.new(product_params)
    if @product.save
      flash[:notice] = 'Product Created Successfully'
      redirect_to(:action => 'index', :category_id => @category.id)
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
      flash[:notice] = 'Product Updated Successfully'
      redirect_to(:action => 'index', :category_id => @category.id)
    else
      render('edit')
    end
  end

  def destroy
    @product = Product.find(params[:id]).destroy
    flash[:notice] = 'Product Deleted Successfully'
    redirect_to(:action => 'index', :category_id => @category.id)
  end

  private
    
    def product_params
      params.require(:product).permit(:name, :price, :image, :category_id)
    end

    def find_category
      if params[:category_id]
        @category = Category.find(params[:category_id])
      end
    end
end
