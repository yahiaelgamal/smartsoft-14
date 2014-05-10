class Memberemail < ActionMailer::Base
 	default :from => "admin@healthygrocery.com"
 	def welcome_email(member,token)
    @member = member
	@token = token
    @url  = 'http://localhost:3000/members/sign_in'
    mail(to: member.email, subject: 'Welcome to Our Awesome Site')
  end
end
