class Registration < ApplicationRecord
  belongs_to :user
  belongs_to :club
  belongs_to :sig  # Associate the registration with a specific SIG


  attr_accessor :sig_ids
  enum status: { pending: 'pending', accepted: 'accepted', rejected: 'rejected' }

  def progress_to_next_round(next_round)
    update(current_round: next_round.round_number)
  end

  def move_forward!
    update(moving_forward: true)
  end

  def reject
    update(moving_forward: false, status: 'rejected')
  end
end
