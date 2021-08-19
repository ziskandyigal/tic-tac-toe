class Comment < ApplicationRecord
  after_initialize { self.time = Time.now }
  validates :text, presence: :true

  belongs_to :user
  belongs_to :game
end
