class WorkLog < ActiveRecord::Base
  
  validates :content, :presence => true
  validates :log_date, :presence => true

  belongs_to :user

  scope :filter_by_month, lambda{|q|  where('log_date >= ? and log_date <= ?', q, q.next_month)}

  class << self
    def statistics_by_user(user_name, filter_date)
      users = []
      if user_name.blank?
        users = User.all
      else
        u = User.find_by_real_name(user_name)
        unless u.nil?
          users << u
        end
      end

      result=[]
      users.each do |user|
        record = []
        record << user.real_name
        record << user.work_logs.filter_by_date(filter_date).size
        result << record
      end
      result
    end
  end
end
