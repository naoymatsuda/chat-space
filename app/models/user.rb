class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # has_many chats
  has_many :groups,through: :user_groups
  has_many :user_groups
  has_many :chats

  scope :name_search,->(current_user,keyword){ where('name LIKE(?)',"%#{keyword}%").where.not( id: current_user )}
end
