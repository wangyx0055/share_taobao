require 'open-uri'

class Item < ActiveRecord::Base

  validates :url, presence: true, format: URI::regexp(%w(http https))
  validates :image_url, format: URI::regexp(%w(http https)), allow_blank: true
  validates :short_url, uniqueness: true, allow_blank: true

  before_create :set_short_url
  before_create :set_title_and_image_url

  def self.magic_find(id_or_short_url)
    find_by(id: id_or_short_url) || find_by(short_url: id_or_short_url)
  end
  
  private

  def set_short_url
    self.short_url = SecureRandom.hex(2)
  end

  def set_title_and_image_url
    page = Nokogiri::HTML(open(self.url))
    self.title = page.xpath("//title").text
    self.image_url = page.xpath("//img[@id='J_ImgBooth']//@src").to_s
  end

end
