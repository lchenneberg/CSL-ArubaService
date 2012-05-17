class User
  include MongoMapper::Document


  key :email, String
  key :username, String
  key :first_name, String
  key :last_name, String
  key :encrypted_password, String
  key :password_salt, String
  key :reset_password_token, String
  key :remember_token, String
  key :remember_created_at, Time
  key :sign_in_count, Integer
  key :current_sign_in_at, Time
  key :current_sign_in_ip, String
  key :last_sign_in_at, Time
  key :last_sign_in_ip, String
  key :confirmed_at, Time
  key :confirmation_token, String
  key :confirmation_sent_at, Time
  key :unconfirmed_email, String
  key :space_used, Integer
	key :failed_attempts, Integer
	key :unlock_token, String
	key :locked_at, Time
  key :authentication_token, String

  key :reset_password_sent_at, Time
  key :reset_password_token, String
  #key :invitation_token, String
	#key :invitation_sent_at, Time
  key :trial_end_date, Time
	key :active_subscription, Boolean

  timestamps!

  
  
	ensure_index [[:confirmation_token,1]], :unique => true
	ensure_index [[:email,1]], :unique => true
	ensure_index [[:reset_password_token,1]], :unique => true
	ensure_index [[:authentication_token,1]],:unique => true
	#ensure_index(:)
	#ensure_index(:)

  attr_accessible :email, :password, :password_confirmation

  many :events, :class => Wys::Event

  
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :token_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable,
         :timeoutable, :confirmable, :lockable#, :invitable#, :omniauthable
	
	

end
