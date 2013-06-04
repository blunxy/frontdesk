class TypeaheadPrefetchTemplate

  def initialize(attendee)
    @hash = { }
    @attendee = attendee
    build_hash
  end

  def to_json
    JSON.generate(@hash)
  end


  private

  def build_hash
    add_full_name_to_hash
    add_tokens_to_hash
    add_email_to_hash
  end

  def add_full_name_to_hash
    @hash[:value] = "#{@attendee.first_name} #{@attendee.last_name}"
  end

  def add_tokens_to_hash
    tokens = []
    tokens << @attendee.first_name.downcase
    tokens << @attendee.last_name.downcase
    tokens << email_prefix
    tokens << email_suffix
    @hash[:tokens] = tokens
  end

  def add_email_to_hash
    @hash[:email] = @attendee.email
  end


  def email_match
    @attendee.email.match(/\A(\w+)@(\w+)\./)
  end

  def email_prefix
    email_match[1]
  end

  def email_suffix
    email_match[2]
  end



end
