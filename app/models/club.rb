class Club < ApplicationRecord
  belongs_to :user
  has_one :schedule, dependent: :destroy
  accepts_nested_attributes_for :schedule
end
