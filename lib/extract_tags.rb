require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'unirest'

class Grab_text

  def initialize(file)
    @file = file
  end 
  
  def print_html
    page = Nokogiri::HTML(open(@file))
    page
  end 
  
  def check_auth(username='', password='')
    response = Unirest.get @file, auth:{:user=>username, :password=>password}
    response.code
  end 

  def print_auth_page(username, password)
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
