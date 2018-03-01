class Ride < ActiveRecord::Base
  # write associations here

  belongs_to :user
  belongs_to :attraction

  def take_ride
    if self.user.tickets < self.attraction.tickets && self.user.height <= self.attraction.min_height
      "Sorry. You do not have enough tickets to ride the #{attraction.name}. You are not tall enough to ride the #{attraction.name}."
    elsif self.user.tickets < self.attraction.tickets
      "Sorry. You do not have enough tickets to ride the #{attraction.name}."
    elsif self.user.height <= self.attraction.min_height
      "Sorry. You are not tall enough to ride the #{attraction.name}."
    else
      tickets = self.user.tickets - self.attraction.tickets
      happiness = self.user.happiness + self.attraction.happiness_rating
      nausea = self.user.nausea + self.attraction.nausea_rating
      # binding.pry
      self.user.update(tickets: tickets, happiness: happiness, nausea: nausea)
    end
  end
  
end
