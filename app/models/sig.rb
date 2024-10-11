class Sig < ApplicationRecord
  belongs_to :club


  # accepts_nested_attributes_for :schedule

  has_many :announcements
  has_many :schedules, dependent: :destroy  # Ensure this line is present
  has_many :rounds, through: :schedules
end
