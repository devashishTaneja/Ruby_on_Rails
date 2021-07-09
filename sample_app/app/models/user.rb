class User < ApplicationRecord
    # before_save { self.email = email.downcase }
    before_save { self.email.downcase! }
    validates :name, presence: true, length: { maximum: 50 }
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, length: { maximum: 50 }, format: {with: VALID_EMAIL_REGEX}, uniqueness:{case_sensitive: false}
    # uniqueness:{case_sensitive: false}
    # doesnot ensure uniqueness at database level
    # simultaneous requests
    has_secure_password
    validates :password, presence: true, length: { minimum: 6 }
end
