class User < ActiveRecord::Base
  devise :database_authenticatable,
         :confirmable,
         :recoverable,
         :rememberable,
         :trackable,
         :validatable

  belongs_to :dealer
  has_many :weowe_forms

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  before_save { self.email = email.downcase }

  validates_presence_of :dealer_id
  validates :first_name, presence: true, length: { maximum: 15 }
  validates :last_name,  presence: true, length: { maximum: 25 }
  validates :email, presence: true,
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }

  validates :password,
            confirmation: true,
            presence: true,
            length: { minimum: 6 },
            on: :create
  validates :password,
            confirmation: true,
            presence: true,
            length: { minimum: 6 },
            on: :update,
            allow_blank: true

  comma do
    last_name 'Last Name'
    first_name 'First Name'
    email 'Email'
    phone_number 'Phone Number'
    department 'Department'
    active 'Active'
    admin 'Admin'

  end

  def self.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def self.encrypt(token)
    Digest::SHA1.hexdigest(token.to_s)
  end
end
