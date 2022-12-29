class CategoriesController < ApplicationController

  before_action :admin_access, except: [:show]
  before_action :authenticate_user!, except: [:show]
  before_action :cart_count

  
  def index
    @categories = Category.all
  end

  def show
    @categories = Category.all
    if params[:search].present?
        @categories =  Product.where('name ILIKE ?', "%#{params[:search]}%")
    end
    @category = Category.find(params[:id])
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(params_category)
    if @category.save
      flash[:notice] = 'Category was successfully created.'
      redirect_to(:action => 'index')
    else
      render :action => 'new'
    end
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    if @category.update(params_category)
      flash[:notice] = 'Category Updated successfully.'
      redirect_to(:action => 'index')
    else
      render :action => 'edit'
    end
  end

  def destroy
    @category = Category.find(params[:id]).destroy
    flash[:notice] = 'Category Deleted Successfully'
    redirect_to(:action => 'index')
  end

  private
  def params_category
    params.require(:category).permit(:name)
  end

end
