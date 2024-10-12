class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class

  def authorize_admin!
    unless current_user.admin?
      redirect_to root_path, alert: 'You do not have permission to perform this action.'
    end
  end
end
