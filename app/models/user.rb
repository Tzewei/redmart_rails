class User < ApplicationRecord
  before_save { self.email.downcase! }


  # VALIDATION
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates(  :name,
              presence: true,
              length: { maximum: 50, message: 'Input name is too long!' }
  )

  validates(  :email,
              presence: true,
              length: { maximum: 75 },
              format: { with: VALID_EMAIL_REGEX },
              uniqueness: { case_sensitive: false }
  )
validates( :password_digest, presence: true, length: { minimum: 3 })

# FOR HASHING PASSWORD
  has_secure_password


# Relationship model
  has_many :reviews

end