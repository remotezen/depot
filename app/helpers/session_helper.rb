module SessionHelper
  include VisitCounter
  def session_counter
    session[:counter]
  end
end
