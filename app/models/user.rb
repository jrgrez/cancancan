class User < ApplicationRecord
  has_many :post, dependent: :destroy
  has_many :comments
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def to_s
  	"#{self.email}"
  end

  enum role: {normal: 0, admin: 1, guest: 2}

end
