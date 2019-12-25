class User < ApplicationRecord
  has_secure_password
  has_many :secrets
  validates :email, :name, presence:true
  validates :email, uniqueness: true

  def user_serializer
    {
      name: name,
      email: email,
      id: id
    }
  end
end

# why is it okay that I dont have password presence:true?
# has_secure_password - comes with a password validation
