module VisitCounter
  extend ActiveSupport::Concern
  
  private
  def counter
    if session[:counter].nil?
       session[:counter] = 1 
    else
      razor = "#{controller_name}_#{action_name}" 
       session[:counter] += 1 if(razor.to_s == "store_index" )
    end
  end 
  
  def reset_counter
    session[:counter] = nil
  end
  
end
