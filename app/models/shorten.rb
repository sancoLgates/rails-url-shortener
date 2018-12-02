class Shorten < ApplicationRecord
  has_many :hitlogs
  validates :real_url, presence: true
  validates :real_url, uniqueness: { case_sensitive: false }
  validates :short_url, uniqueness: { case_sensitive: false }
  before_validation :add_url_protocol
  before_create :record_shorten

  private
    def record_shorten
      self.count = 0;
      self.short_url = ([*('A'..'Z'),*('a'..'z'),*('0'..'9')]-%w(0 1 I O)).sample(6).join
    end

  protected 
    def add_url_protocol
      unless self.real_url[/\Ahttp:\/\//] || self.real_url[/\Ahttps:\/\//]
        self.real_url = "http://#{self.real_url}"
      end
    end
end
