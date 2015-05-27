class Gig < ActiveRecord::Base
  validates :name, :location, :date, presence: true
end
