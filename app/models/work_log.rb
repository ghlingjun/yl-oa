class WorkLog < ActiveRecord::Base
  
  validates :content, :presence => true
  validates :log_date, :presence => true

  belongs_to :user
end
