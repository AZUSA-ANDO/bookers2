class User < ApplicationRecord
  has_many :books, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :authentication_keys => [:name]

  validates :introduction, presence: false, length: { maximum: 50 } # 自己紹介の最高文字数は50文字
  validates :name, uniqueness: true
  validates :name, length: { in: 2..20 }

  attachment :profile_image




end
