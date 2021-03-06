class Song < ActiveRecord::Base
  validates :title, presence: true
  validates :artist_name, uniqueness: {scope: :release_year, message:"can only release a named song once per year"} 
  validates :released, inclusion: {in: [true, false]} 
  validates :artist_name, presence: true
  with_options if: :released do |r|
    r.validates :release_year, presence: true, numericality: { less_than_or_equal_to: Date.today.year}
  end
end
