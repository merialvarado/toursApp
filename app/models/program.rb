class Program < ActiveRecord::Base
  belongs_to :user
  belongs_to :enterprise
  has_many :schedule_dates, dependent: :destroy
  default_scope -> { order(created_at: :desc) }
  mount_uploader :picture, PictureUploader
  validates :user_id, presence: true
  validates :enterprise_id, presence: true
  validates :name, presence: true, length: { maximum: 50 }
  validates :description, length: { maximum: 255 }
  validate  :picture_size
  validates :price, :format => { :with => /\A\d+(?:\.\d{0,2})?\z/ }, :numericality => {:greater_than => 0, :less_than => 99999}

  def schedule
    occurences = []
    schedule_dates.each do |schedule_date|
      occurences << schedule_date.schedule
    end
    occurences
  end

  def occurrences(date=nil)
    date = Date.today if date.nil?
    occurrences = []
    schedule.each do |schedule|
      occurrences << schedule.all_occurrences
    end
    occurrences
  end

  def occurs_at?(date)
    occurs = false
    schedule.each do |schedule|
      if occurs = schedule.occurs_at?(date)
        break
      end
    end
    occurs
  end

  private

    # Validates the size of an uploaded picture.
    def picture_size
      if picture.size > 5.megabytes
        errors.add(:picture, "should be less than 5MB")
      end
    end
end
