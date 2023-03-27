class Book < ApplicationRecord
  validates_presence_of :title
  validates_presence_of :publisher
  validates_presence_of :publication_date
  validates_presence_of :page_count
  validates :is_in_print, presence: true, inclusion: [true, false]

  belongs_to :author
end
