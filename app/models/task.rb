class Task < ActiveRecord::Base
  validates :title, presence: true,
    length: {maximum: 68}
  validates :priority,
    numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 1000 }


  scope :complete, -> { where(complete: true) }
  scope :incomplete, -> { where(complete: false) }


  def self.maximum_priority
    Task.maximum(:priority) || 0
  end

  def set_maximum_priority
    self.priority = self.class.maximum_priority + 1

    self
  end

  belongs_to :user

end
