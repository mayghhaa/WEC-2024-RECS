class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  enum role: { student: 'student', convener: 'convener' }
  has_many :clubs
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


end
