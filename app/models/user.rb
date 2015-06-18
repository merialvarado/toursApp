class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable
  before_save do
    #self.email = email.downcase
    self.role = Role.find_by name: "Regular" if self.role.nil?
  end
  belongs_to :role
  has_many :programs, :dependent => :destroy
  has_many :enterprises

  validates :name,  presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
    format: { with: VALID_EMAIL_REGEX },
    uniqueness: { case_sensitive: false }

  #validates :password, length: { minimum: 6 }

  # Returns the hash digest of the given string.
  #def User.digest(string)
  #  cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
  #    BCrypt::Engine.cost
  #  BCrypt::Password.create(string, cost: cost)
  #end

  def admin?
    if self.id == nil
      false
    else
      self.role.name == "Admin"
    end
  end
  def seller?
    if self.id == nil
      false
    else
      self.role.name == "Seller"
    end
  end
  def regular?
    if self.id == nil
      false
    else
      self.role.name == "Regular"
    end
  end
end
