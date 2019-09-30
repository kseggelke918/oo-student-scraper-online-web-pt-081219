require 'open-uri'
require 'nokogiri'
require 'pry'

class Scraper

  def self.scrape_index_page(index_url)
    html = open(index_url)
    index_page = Nokogiri::HTML(html)
    students = []
    
    index_page.css("div.student-card").each do |student|
      student_info = {
      :name => student.css("div.card-text-container h4.student-name").text, 
      :profile_url => student.css("a").attribute("href").text, 
      :location => student.css("div.card-text-container p.student-location").text 
      }
      students << student_info
    end 
    students 
  end

  def self.scrape_profile_page(profile_url)
    html = open(profile_url)
    profile_page = Nokogiri::HTML(html)
    student = {}
    
    profile_page.css("div.vitals-container").each do |details|
      student[:twitter] => details.css("a").attribute("href")[0].text 
      student[:linkedin] => details.css("a").attribute("href")[1].text
      student[:github] => details.css("a").attribute("href")[2].text
      student[:blog] => details.css("a").attribute("href")[3].text
    end 
    
    
  end

end

