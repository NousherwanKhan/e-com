class Product < ApplicationRecord
    has_one_attached :image
    belongs_to :category
    belongs_to :user
    
    validates :name, :presence => true,
                    :length => { :within => 1..100 }
    validates :price, :presence => true,
                     :length => { :within => 1..10}
    validates :image, :presence => true

end
