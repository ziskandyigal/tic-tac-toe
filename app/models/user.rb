class User < ApplicationRecord
    validates :email, uniqueness: true
    validates_format_of :email, with: /@/
    validates :password_digest, presence: true

    # utilise ActiveModel:SecurePassword:has_secure_password interface integration with bcrypt
    has_secure_password
    # assiciation
    has_many :games, dependent: :destroy
    has_many :comments, dependent: :destroy
end
