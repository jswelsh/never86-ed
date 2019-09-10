module ApplicationHelper

  def fillColor
    case 60
    when 80..100
      "full progress-bar progress-bar-striped"
    when 60..79
      "sixtyUp progress-bar progress-bar-striped"
    when 40..59
      "fortyUp progress-bar progress-bar-striped"
    when 20..39
      "twentyUp progress-bar progress-bar-striped"
    when 0..19
      "emptyUp progress-bar progress-bar-striped"
    end
  end 

    def fillPercentage
      65
    end
  end
  

