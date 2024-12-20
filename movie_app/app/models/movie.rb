class Movie < ApplicationRecord
  validates :title, presence: true
  validates :director, presence: true

  def self.ransackable_attributes(auth_object = nil)
    [ "title", "release_year", "director", "created_at", "updated_at", "id" ]
  end
end
