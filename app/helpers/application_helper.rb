module ApplicationHelper
  def nl2br(str)
    str.gsub(/\r\n/, '<br/>')
  end

  def format_date_name (pdate)
    pdate.strftime("%d %B %Y")
  end

  def format_date (pdate)
    pdate.strftime("%d-%m-%Y")
  end

  def format_number(pnum)
    number_with_precision(pnum, delimiter: ',', precision: 2, strip_insignificant_zeros: true)
  end

  def full_title(page_title)
    #base_title = "EventManager"
    #if page_title.empty?
    #  base_title
    #else
    # "#{base_title} | #{page_title}"
    #end
    "#{page_title}"
  end
end
