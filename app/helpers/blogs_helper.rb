module BlogsHelper
  def show_date(time)
    time.strftime('%Y/%m/%d')
  end
end
