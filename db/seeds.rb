class UserImporter
  def self.import

  		name = "sam"
  		email = "sam@gmail.com"
  		password = "12345678" 
    	user = User.create(name: name, email: email, password: password)    	
      
      name = "carmen"
      email = "carmen@gmail.com"
      password = "12345678" 
      user = User.create(name: name, email: email, password: password)      
    

  end
end

UserImporter.import