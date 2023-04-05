class Book < ApplicationRecord
  belongs_to :subject
validates_presence_of :title, :author, :publisher
validates_uniqueness_of :title
validates_numericality_of :year
validate :year_up_to_present
def year_up_to_present
errors.add(:field_name, 'Year must not be in the future') if year >
Time.now.year
end
