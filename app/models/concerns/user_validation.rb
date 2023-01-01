module UserValidation


extend ActiveSupport::Concern

VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i

  included do

    validates :email, :presence => true,
              :length => { :maximum => 40},
              :format => VALID_EMAIL_REGEX,
              :confirmation => true,
              :uniqueness => true
    validates :password, :presence => true

    validates :username, :presence => true

    end
end