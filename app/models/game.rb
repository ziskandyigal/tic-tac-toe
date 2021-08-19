class Game < ApplicationRecord
  after_initialize :set_time

  scope :win, lambda { |_|
    where(:status => "win")
  }

  enum status: [:win, :lose, :draw], _default: "draw"

  belongs_to :user
  has_many :comments, dependent: :destroy

  private 

  def set_time
    self.time = Time.now
  end
end
