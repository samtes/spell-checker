require 'rubygems'
require 'nokogiri'
require 'open-uri'

class Grab_text

  def initialize(file)
    @file = file
  end

  def check_auth
   response = Unirest.get @file
   response.code
  end

  def print_auth_page(username, password)
    (open(@file, :http_basic_authentication => [username, password]))
    page = Nokogiri::HTML(open(@file, :http_basic_authentication => [username, password]))
    page.css('script').remove()
    page.css('body').text
  end

  def print_text
    page = Nokogiri::HTML(open(@file))
    page.css('script').remove()
    page.css('body').text
  end
  
end
