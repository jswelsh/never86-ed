module ApplicationHelper

  def fillColor
    case 60
    when 80..100
      "progress-bar progress-bar-striped progress-bar-animated--full"
    when 60..79
      "progress-bar progress-bar-striped progress-bar-animated--sixtyUp"
    when 40..59
      "progress-bar progress-bar-striped progress-bar-animated--fortyUp"
    when 20..39
      "progress-bar progress-bar-striped progress-bar-animated--twentyUp"
    when 0..19
      "progress-bar progress-bar-striped progress-bar-animated--emptyUp"
    end
  end 

    def fillPercentage
      65
    end
  end
  

