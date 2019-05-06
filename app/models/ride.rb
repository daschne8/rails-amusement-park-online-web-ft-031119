class Ride < ApplicationRecord
  belongs_to :user
  belongs_to :attraction

  def take_ride
    user = self.user
    attraction = self.attraction
    if user.tickets >= attraction.tickets && user.height >= attraction.min_height
      user.tickets -= attraction.tickets
      user.happiness += attraction.happiness_rating
      user.nausea += attraction.nausea_rating
      user.save
    else
      message = ["Sorry."]
      if user.tickets <= attraction.tickets
        message << "You do not have enough tickets to ride the #{attraction.name}."
      end
      if user.height <= attraction.min_height
        message << "You are not tall enough to ride the #{attraction.name}."
      end
      message = message.join(" ")
      return message
    end

  end

end
