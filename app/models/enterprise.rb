class Enterprise < ActiveRecord::Base
  before_create :normalize_phone_number
  belongs_to :region
  belongs_to :user

  has_one :address, :dependent => :destroy

  validates :name,  presence: true, length: { maximum: 50 }
  
  validates :user_id, presence: true
  validates :description, length: { maximum: 1000 }
  validates :phone_number, :phony_plausible => true, presence: true

  # Normalizes the attribute itself before validation
  phony_normalize :phone_number, :default_country_code => 'AR'

  private
  def normalize_phone_number
    self.phone_number = PhonyRails.normalize_number(phone_number, country_code: 'AR')
  end
end
