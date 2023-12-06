class Task < ApplicationRecord
    belongs_to :user
    
      after_initialize :set_default_status, if: :new_record?

  def set_default_status
    self.status ||= 'Not Start'
  end
end
