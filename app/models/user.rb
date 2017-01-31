class User < ActiveRecord::Base
  has_secure_password

  has_many :finests, dependent: :destroy

  validates :name, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }

end
