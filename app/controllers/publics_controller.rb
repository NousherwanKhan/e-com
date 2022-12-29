class PublicsController < ApplicationController
   
  before_action :user_cart
  before_action :cart_count

    def index
      @categories = Category.all

        if   user_signed_in?
            @carts = @user.carts.all
        end
        if params[:search].present?
            @products =  Product.joins(:category).where('categories.name ILIKE ? or products.name ILIKE ?', "%#{params[:search]}%" , "%#{params[:search]}%")
        else
            @products = Product.all
        end
    end


end

