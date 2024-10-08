
class Announcement < ApplicationRecord
  belongs_to :club
  belongs_to :sig, optional: true
end
