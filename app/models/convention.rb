class Convention < ActiveRecord::Base
  # attr_accessible :title, :body


  def self.current
    Convention.new
  end

  def attendees
    Attendee.all
  end


end
