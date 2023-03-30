class Author < ApplicationRecord
  validates_presence_of :name
  validates_presence_of :birthdate
  validates_presence_of :citation_count
  validates :is_alive, exclusion: [nil]

  has_many :books

  def self.sort_by_created_at
    Author.order(:created_at)
  end

  def self.sort_by_book_count
    Author.joins(:books).order(book_count: :desc).group(:id).select(:name).select(:id).select("COUNT(books.id) AS book_count")
  end

  def self.exact_match_name(name)
    Author.where("LOWER(name) LIKE '#{name.downcase}'")
  end

  def self.search_name(name)
    Author.where("LOWER(name) LIKE '%#{name.downcase}%'")
  end

  def book_count
    Book.where(author_id: id).count
  end
end
