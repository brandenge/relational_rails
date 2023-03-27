class Author < ApplicationRecord
  validates_presence_of :name
  validates_presence_of :birthdate
  validates_presence_of :citation_count
  validates :is_alive, presence: true, inclusion: [true, false]

  has_many :books
end
