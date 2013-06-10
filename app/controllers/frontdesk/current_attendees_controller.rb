require 'services/express_check_in/typeahead/prefetch'
require 'services/express_check_in'

class Frontdesk::CurrentAttendeesController < ApplicationController

  def index
  end

  def prefetch
    eligible_members =
      ExpressCheckIn.eligible_members(Convention.current)

    prefetch =
      ExpressCheckIn::Typeahead::Prefetch.
      build_from(eligible_members).
      to_json

    render :json => prefetch
  end

end
