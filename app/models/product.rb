class Product < ApplicationRecord
    has_one_attached :image
    belongs_to :sub_category

    validates :name, :presence => true,
                    :length => { :within => 1..100 }
    validates :price, :presence => true,
                     :length => { :within => 1..10}
    # validate :category :

end
