class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum role: [:admin, :manager, :guest]

  validates :email, format: { with: /\b[A-Z0-9._%a-z\-]+@.*jkuat\.ac\.ke\z/,
                  message: "must be a jkuat.ac.ke account" }

end
