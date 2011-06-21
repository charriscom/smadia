module PromotionsHelper
  def countdown_time (date)
    if date
      return date.strftime("%Y/%m/%d")
    else
      return date
    end
  end
end
