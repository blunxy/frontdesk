require 'services/typeahead_formatter'

class Frontdesk::CurrentAttendeesController < ApplicationController

  def index

  end

  def foos
    render :json => TypeaheadFormatter.prefetch
  end



end
