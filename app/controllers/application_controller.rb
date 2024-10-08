class ApplicationController < ActionController::Base
  include Pundit

  helper_method :current_user_convener?, :current_user_student?


  def current_user_convener?(club)
    current_user && current_user.convener?
  end
  def current_user_student?
    current_user && current_user.student?
  end
end
