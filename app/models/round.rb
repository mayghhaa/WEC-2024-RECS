class Round < ApplicationRecord
  belongs_to :schedule
  belongs_to :club
  belongs_to :sig, optional: true

  validates :round_name, :start_date, :end_date, presence: true

  has_many :registrations

  def complete_round!
    update(round_completed: true)
    registrations.where(moving_forward: true).update_all(round: next_round)
  end

  def final_selected_candidates
    registrations.where(moving_forward: true, round: nil)  # This assumes nil means final selection
  end

end
