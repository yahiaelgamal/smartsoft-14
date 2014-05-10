# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
HealthyGrocery::Application.initialize!
ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.smtp_settings = {
   :tls => true,
   :address => "smtp.gmail.com",
   :port => 587,
   :domain => "gmail.com",
   :authentication => :login,
   :user_name => "mohamed.lotfy.hammad@gmail.com",
   :password => "LOLO1893"
 }

