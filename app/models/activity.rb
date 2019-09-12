class Activity < ApplicationRecord
  belongs_to :user
  def self.avg_group_by_day(start)
    activities = where( date: start.beginning_of_day..Time.zone.now)
    activities = where( user_id: User.current)
    activities = activities.group("date(date)")
    activities = activities.select("date, AVG(weight) as avg_weight")
    activities.group_by {|a| a.date.to_date}
  end
end
