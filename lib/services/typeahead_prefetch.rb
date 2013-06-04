class TypeaheadPrefetch


  def self.create_from(current_attendees)

    [
     {
       value: 'Bob Hope',
       tokens: ['bob', 'hope', 'bh', 'example'],
       email: "bh@example.com"
     }

    ]

  end


end
