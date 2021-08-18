class User < ApplicationRecord
    validates :email, uniqueness: true
    validates_format_of :email, with: /@/
    validates :password_digest, presence: true

    # utilise ActiveModel:SecurePassword:has_secure_password interface integration with bcrypt
    has_secure_password
    # assiciation
    has_many :game, dependent: :delete_all
end
