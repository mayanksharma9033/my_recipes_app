class Chef < ActiveRecord::Base
  has_many :recipes
  has_many :likes
  before_save { self.email=email.downcase }
  validates :chefname, presence: true, length:{minimum:3 , maximum:40}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true,  length: {maximum:105},
                                       uniqueness: {case_sensitive: false},
                                       format: {with: VALID_EMAIL_REGEX}
 has_secure_password

before_create { generate_token(:auth_token) }

def send_password_reset
  generate_token(:password_reset_token)
  self.password_reset_sent_at=Time.zone.now
  save!
  ChefMailer.password_reset(self).deliver
 end

 def generate_token(column)
 	begin
 		self.column=SecureRandom.urlsafe_base64
 	end while Chef.exists?(column=>self[column])
 end
 
end