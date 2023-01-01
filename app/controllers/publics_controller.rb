class PublicsController < ApplicationController
   
  before_action :user_cart
  before_action :cart_count

    def index
      @categories = Category.includes(:name)

        if   user_signed_in?
            @carts = @user.carts.includes(:user_id)
        end
        if params[:search].present?
            @products =  Product.joins(:category).where('categories.name ILIKE ? or products.name ILIKE ?', "%#{params[:search]}%" , "%#{params[:search]}%")
        else
            @products = Product.all.includes(image_attachment: :blob)
        end
    end


end

