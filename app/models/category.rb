class Category < ActiveRecord::Base
	validates :name, presence: true, length: { minimum: 3, maximum: 25 }
  validates_uniqueness_of :name

  has_many :note_categories
  has_many :notes, through: :note_categories
end
