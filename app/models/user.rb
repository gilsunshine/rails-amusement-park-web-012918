class User < ActiveRecord::Base
  # write associations here
  has_secure_password

  has_many :rides
  has_many :attractions, through: :rides

  validates :name, :height, :nausea, :happiness, :tickets, presence: true
  validates :admin, inclusion: {in: [true, false]}
  validates :name, uniqueness: true

  def mood
    if self.nausea > self.happiness
      'sad'
    else
      'happy'
    end
  end
end
