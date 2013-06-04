Frontdesk::Application.routes.draw do

  namespace :frontdesk do

    match "express_check_in" => "current_attendees#index"
    match "foos" => "current_attendees#foos"

  end

end
