class Product < ApplicationRecord

    has_one_attached :image
    belongs_to :category
    has_many :carts

    # scope :search, lambda{ |query| where(['name LIKE ?', '%' + query +'%'])}

    validates :name, :presence => true,
                     :uniqueness => true,
                    :length => { :within => 1..100 }
    validates :price, :presence => true,
                     :length => { :within => 1..10}
    validates :image, :presence => true

    
    def image_as_thumbnails
        image.variant(resize_to_limit: [100, 50]).processed
    end

    def image_as_card
        image.variant(resize_to_limit: [300, 300]).processed
    end
end
