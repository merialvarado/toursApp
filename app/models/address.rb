class Address < ActiveRecord::Base
  belongs_to :region
  belongs_to :enterprise

  validates :street,  presence: true, length: { maximum: 50 }
  validates :postal_code,  presence: true, length: { maximum: 10 }
  validates :region_id, presence: true
  validates :enterprise_id, presence: true
end
