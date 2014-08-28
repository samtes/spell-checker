require 'uri'

class Url_check

SCHEMES = %w(http https)

  def initialize(url)
    @url = url
  end

  def validate
    if @url =~ URI::regexp
      1
    else 
      0
    end
  end    

end
