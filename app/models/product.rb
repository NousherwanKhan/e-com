class Product < ApplicationRecord

    include ProductValidatable
    include ImageResize
    
    has_one_attached :image
    belongs_to :category
    has_many :carts

    # scope :search, lambda{ |query| where(['name LIKE ?', '%' + query +'%'])}




end
