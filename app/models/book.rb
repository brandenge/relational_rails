class Book < ApplicationRecord
  validates :title, presence: true
  validates :publisher, presence: true
  validates :publication_date, presence: true
  validates :page_count, presence: true, numericality: true
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
