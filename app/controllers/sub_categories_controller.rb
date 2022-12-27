class SubCategoriesController < ApplicationController

  before_action :authenticate_user!
  before_action :find_category

  def index
    @sub_categories = @category.sub_categories.all
  end

  def show
    @sub_category = SubCategory.find(params[:id])
  end

  def new
    @sub_category = SubCategory.new(:category_id => @category.id)
  end

  def create
    @sub_category = SubCategory.new(params_sub_category)
    if @sub_category.save
      redirect_to(:action => 'index', :category_id => @category.id)
    else
      render('new')
    end
  end

  def edit
    @sub_category = SubCategory.find(params[:id])
  end
  
  def update
    @sub_category = SubCategory.find(params[:id])
    if @sub_category.update(params_sub_category)
      redirect_to :action => 'index', :category_id => @category.id, notice: 'Category was successfully updated.'
    else
      render 'edit'
    end
  end

  def destroy
    @sub_category = SubCategory.find(params[:id]).destroy
    redirect_to :action => 'index', :category_id => @category.id
  end

  private
  def params_sub_category
    params.require(:sub_category).permit(:name, :category_id)
  end

  def find_category
    if params[:category_id]
      @category = Category.find(params[:category_id])
    end
  end

end
