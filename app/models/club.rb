class Club < ApplicationRecord
  belongs_to :user


  has_many :sigs, dependent: :destroy
  accepts_nested_attributes_for :sigs
end
