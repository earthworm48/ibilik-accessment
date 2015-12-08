class UserImporter
  def self.import

  		name = "sam"
  		email = "sam@gmail.com"
  		password = "12345678" 
    	user = User.create(name: name, email: email, password: password)    	  
    
      20.times do
        name = Faker::Name.name
        email = Faker::Internet.email
        password = "12345678" 
        
        user = User.create(name: name, email: email, password: password)

        title = Faker::Lorem.sentence
        description = Faker::Lorem.paragraph
        random = rand(1...20)

        property = Property.create(title: title, description: description, user_id: random)
        
        description = Faker::Lorem.paragraph

        comment = Comment.create(description: description, user_id: rand(1...20), property_id: rand(1...20))

        start_date = Faker::Date.forward(10)
        end_date = Faker::Date.forward(100)

        booking = Booking.create(start_date: start_date, end_date: end_date, user_id: rand(1...20), property_id: rand(1...20))

        
      end 

  end
end

UserImporter.import