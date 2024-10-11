class Schedule < ApplicationRecord
  belongs_to :sig, optional: true
  belongs_to :club
  has_many :rounds, dependent: :destroy
end
