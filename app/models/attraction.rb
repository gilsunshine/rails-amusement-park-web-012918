class Attraction < ActiveRecord::Base
  # binding.pry
  # validates :name, :min_height, :tickets, presence: true
  # validates :happiness_rating, :nausea_rating, inclusion: {in: 1..5}
  # write associations here
  has_many :rides
  has_many :users, through: :rides

end
