class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  def get_gravatar
    gravatar_id = Digest::MD5::hexdigest(email.downcase)
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}"
  end
end
