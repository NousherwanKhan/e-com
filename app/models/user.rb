class User < ApplicationRecord
  
  include UserValidation

  has_one :role
  has_many :carts
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, 
         :registerable,
         :recoverable, 
         :rememberable, 
         :validatable,
         :trackable

end
