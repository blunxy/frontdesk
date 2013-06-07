def first_name(full_name)
  full_name.split[0]
end

def last_name(full_name)
  full_name.split[1]
end


Given(/^an attendee "(.*?)" with email "(.*?)"$/) do |full_name, email|
  @current_attendees = []
  @attendee = stub(:first_name => first_name(full_name),
                   :last_name => last_name(full_name),
                   :email => email)
  @current_attendees << @attendee
end

Given(/^a bunch of attendees without matching names or emails$/) do
  @current_attendees << stub(:first_name => "xc",
                             :last_name => "xx",
                             :email => "jx@example.com")
  @current_attendees << stub(:first_name => "xd",
                             :last_name => "xy",
                             :email => "jy@example.com")
  @current_attendees << stub(:first_name => "xe",
                             :last_name => "xz",
                             :email => "jz@example.com")
end

Given(/^I'm on the express check\-in page$/) do
  visit frontdesk_express_check_in_path

end


When(/^I search for "(.*?)"$/) do |search_term|
  fill_in "search_term", :with => search_term

  # need to do the following to trigger the Twitter Typeahead
  page.execute_script %Q{  $('input#search_term').trigger('focus'); }

end

Then(/^the dropdown should contain all attendees with matching names and emails$/) do
  p page.html
  page.source.should have_css('p', :text => "firsto-1 lasto-1")
  page.source.should have_css('p', :text => "mailo1@1maily.com")
end
