class CurrentAttendees

  def initialize
    @attendees = Convention.current.attendees
  end


  def with_preprinted_badges
    @attendees.select do |attendee|
      attendee if BulkBadgeManager.badged?(attendee)
    end
  end


end
