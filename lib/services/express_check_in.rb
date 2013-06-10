module ExpressCheckIn

  extend self

  def eligible_members(convention)
    convention.attendees || []
  end


end
