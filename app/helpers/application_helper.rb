module ApplicationHelper
  def date_timestamp(date)
    date.nil? ? "" : date.strftime("%m-%d-%Y %I:%M:%S %p")
  end
end
