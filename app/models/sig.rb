class Sig < ApplicationRecord
  belongs_to :club

  has_one :schedule, dependent: :destroy
  accepts_nested_attributes_for :schedule
end
