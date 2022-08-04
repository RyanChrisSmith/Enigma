require 'date'
module TodaysDatable

  def todays_date
    Date.today.strftime("%d%m%y")
  end

end