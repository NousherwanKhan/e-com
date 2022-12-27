class CategoriesController < ApplicationController

  before_action :admin_access
  before_action :authenticate_user!
  
  def index
    @categories = Category.all
  end

  def show
    @category = Category.find(params[:id])
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(params_category)
    if @category.save
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
      redirect_to(:action => 'index')
    else
      render :action => 'edit'
    end
  end

  def destroy
    @category = Category.find(params[:id]).destroy
    redirect_to(:action => 'index')
  end

  private
  def params_category
    params.require(:category).permit(:name)
  end

end
