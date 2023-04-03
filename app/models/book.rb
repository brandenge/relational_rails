class Book < ApplicationRecord
  validates_presence_of :title, :publisher, :publication_date, :page_count
  validates :page_count, numericality: true
  validates :is_in_print, exclusion: [nil, ""]

  belongs_to :author

  def self.in_print
    Book.where(is_in_print: true)
  end

  def self.exact_match_title(title)
    Book.where(title: title)
  end

  def self.search_title(title)
    Book.where("LOWER(title) LIKE '%#{title.downcase}%'")
  end
end
