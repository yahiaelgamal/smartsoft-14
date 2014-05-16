Warden::Strategies.add(:my_strategy) do 
  def valid? 
    true
  end 

  def authenticate! 
    u = Member.find_for_authentication(:email => params[:email])
    if u.nil? || !u.valid_password?(params[:password])
      fail(:invalid)
    elsif !u.confirmed?
      fail!("Account needs confirmation.")
      redirect!("0.0.0.0:3000")
    end
  else
    success!(u)
  end    
end