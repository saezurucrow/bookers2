class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


    has_many :post_books

    attachment :profile_image

    validates :name,
    	 length: { minimum: 2, maximum: 20 },
    	 presence: true

   validates :introduction,
   		length: {maximum: 50 }
end
