class ApplicationController < ActionController::Base
  def welcome
  end

  def convert_check_box(check_box_value)
    case check_box_value
    when '0' then false
    when '1' then true
    end
  end
end
