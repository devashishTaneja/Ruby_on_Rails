class User < ApplicationRecord
    has_many :microposts, dependent: :destroy
    attr_accessor :remember_token
    # before_save { self.email = email.downcase }
    before_save { self.email.downcase! }
    validates :name, presence: true, length: { maximum: 50 }
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, length: { maximum: 50 }, format: {with: VALID_EMAIL_REGEX}
    # uniqueness:{case_sensitive: false}
    # doesnot ensure uniqueness at database level
    # simultaneous requests
    has_secure_password
    validates :password, presence: true, length: { minimum: 6 }, allow_nil: true
    
    def remember
        self.remember_token = SecureRandom.urlsafe_base64
        self.update_column(:remember_digest, BCrypt::Password.create(remember_token))
    end

    def forget
        self.update_column(:remember_digest, nil)
    end
end
