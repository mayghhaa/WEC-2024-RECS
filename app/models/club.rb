class Club < ApplicationRecord
  belongs_to :convener, class_name: 'User', foreign_key: 'convener_id'


  has_many :sigs, dependent: :destroy
  accepts_nested_attributes_for :sigs
  has_many :registrations
  has_many :registered_clubs, through: :registrations, source: :club
end
