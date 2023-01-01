module ProductValidatable
    extend ActiveSupport::Concern

    included do

    validates :name, :presence => true,
                     :uniqueness => true,
                    :length => { :within => 1..100 }
    validates :price, :presence => true,
                     :length => { :within => 1..10}
    validates :image, :presence => true

    
    end
end