class Author < ApplicationRecord
  validates :name, presence: true
  validates :birthdate, presence: true
  validates :citation_count, presence: true, numericality: true
  validates :is_alive, exclusion: [nil, ""]

  has_many :books

  def self.sort_by_book_count
    Author.joins(:books).order(book_count: :desc).group(:id).select(:name).select(:id).select("COUNT(books.id) AS book_count")
  end

  def book_count
    Book.where(author_id: id).count
  end
end
