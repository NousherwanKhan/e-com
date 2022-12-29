class CartsController < ApplicationController

    before_action :authenticate_user!
    before_action :user_access
    before_action :user_cart

  def index
    
    @carts = @user.carts.all

  end


  def create
    @cart = Cart.new(cart_params)
    if @cart.save
      flash[:notice] = 'Product added to Cart successfully'
      redirect_to(:controller => 'publics', :action => 'index')
    else
      redirect_to root_path
    end
    
  end

  def destroy
    @cart = Cart.find(params[:id]).destroy
    flash[:notice] = 'Product deleted from cart'
    redirect_to(:action => 'index',:user_id => current_user.id)
  end

  def delete_all
    
    @carts = Cart.where(:user_id => current_user.id).destroy_all
    flash[:notice] = 'Cart Destroyed successfully'
    redirect_to(:action => 'index',:user_id => current_user.id)

  end


  private
  def user_access
    if current_user.role_id == 1
        redirect_to root_path
    end
  end

  def cart_params
    params.permit(:user_id, :product_id, :category_id)
  end

  

end
