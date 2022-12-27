class User < ApplicationRecord
  


  has_many :products, dependent: :destroy
  has_one :role
  has_many :products
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, 
         :registerable,
         :recoverable, 
         :rememberable, 
         :validatable,
         :trackable


  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i

  validates :email, :presence => true,
                    :length => { :maximum => 40},
                    :format => VALID_EMAIL_REGEX,
                    :confirmation => true,
                    :uniqueness => true
  validates :password, :presence => true

end
