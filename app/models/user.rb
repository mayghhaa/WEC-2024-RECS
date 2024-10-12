class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  enum role: { student: 'student', convener: 'convener', admin: 'admin' }

  has_many :clubs
  has_many :registrations
  has_many :registered_students, through: :registrations, source: :user

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
